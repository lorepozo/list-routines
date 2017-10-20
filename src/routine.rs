#![allow(dead_code)]

use graph::{self, DiGraph};
use serde_json;
use rocket::Outcome;
use rocket::data::{self, Data, FromData};
use rocket::http::Status;
use rocket::request::Request;
use std::fmt;
use std::fs::File;
use std::io::prelude::*;
use std::io::{self, BufReader};
use std::process::{Command, Stdio, ChildStdin, ChildStdout};
use std::sync::{Arc, Mutex, RwLock};

pub struct Manager {
    pub rkt: Arc<Mutex<MetaRacket>>,
    pub store: Arc<RwLock<Store>>,
}
impl Manager {
    pub fn new() -> Result<Self, ()> {
        let rkt = MetaRacket::new().unwrap();
        let store = Store::new().unwrap();
        Ok(Manager {
            rkt: Arc::new(Mutex::new(rkt)),
            store: Arc::new(RwLock::new(store)),
        })
    }
    pub fn open_routine(&self, id: String) -> Option<Routine> {
        if self.store.read().unwrap().g.names.contains(&id) {
            let rkt = self.rkt.clone();
            Some(Routine { id, rkt })
        } else {
            None
        }
    }
}


#[derive(Debug)]
pub enum RacketError {
    InitializeFailure,
    NoPipe,
    RuntimeError,
    InvalidJson,
    IO(io::Error),
}
impl fmt::Display for RacketError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            RacketError::InitializeFailure => write!(f, "failed to initialize racket"),
            RacketError::NoPipe => write!(f, "failed to connect pipe to racket"),
            RacketError::RuntimeError => write!(f, "racket runtime error"),
            RacketError::InvalidJson => write!(f, "racket gave invalid json"),
            RacketError::IO(ref err) => write!(f, "IO error: {}", err),
        }
    }
}
impl ::std::error::Error for RacketError {
    fn description(&self) -> &str {
        "racket error"
    }
}
impl From<io::Error> for RacketError {
    fn from(err: io::Error) -> RacketError {
        RacketError::IO(err)
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
pub enum Input {
    Number(i32),
    Array(Vec<i32>),
    NestedArray(Vec<Vec<i32>>),
}
impl FromData for Input {
    type Error = serde_json::Error;
    fn from_data(_: &Request, data: Data) -> data::Outcome<Self, Self::Error> {
        match serde_json::from_reader(data.open()) {
            Ok(v) => Outcome::Success(v),
            Err(e) => Outcome::Failure((Status::BadRequest, e)),
        }
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
pub enum Output {
    Bool(bool),
    Number(i32),
    Array(Vec<i32>),
}

pub struct Routine {
    id: String,
    rkt: Arc<Mutex<MetaRacket>>,
}
impl Routine {
    /// Validates and executes the input for the routine. Invalid input will give Ok(None).
    pub fn evaluate(&self, inp: Input) -> Result<Option<Output>, RacketError> {
        let op = json!({
            "op": "evaluate",
            "routine": &self.id,
            "input": inp,
        });
        self.rkt.lock().unwrap().execute(op).and_then(|s| {
            serde_json::from_str(&s).map_err(|_| RacketError::InvalidJson)
        })
    }

    /// Gives the examples of valid inputs for the routine.
    pub fn examples(&self) -> Result<Vec<Input>, RacketError> {
        let op = json!({
            "op": "examples",
            "routine": &self.id,
        });
        self.rkt.lock().unwrap().execute(op).and_then(|s| {
            serde_json::from_str(&s).map_err(|_| RacketError::InvalidJson)
        })
    }

    /// Generates a given number of valid inputs for the routine.
    pub fn generate(&self, count: u32) -> Result<Vec<Input>, RacketError> {
        let op = json!({
            "op": "generate",
            "routine": &self.id,
            "params": {
                "count": count,
            },
        });
        self.rkt.lock().unwrap().execute(op).and_then(|s| {
            serde_json::from_str(&s).map_err(|_| RacketError::InvalidJson)
        })
    }
}

pub struct MetaRacket; // TODO: use Racket instead, don't keep on opening procs
impl MetaRacket {
    pub fn new() -> Result<Self, RacketError> {
        Ok(Self {})
    }
    pub fn execute(&mut self, op: serde_json::Value) -> Result<String, RacketError> {
        Racket::new()?.execute(op)
    }
}

pub struct Racket {
    stdin: ChildStdin,
    stdout: BufReader<ChildStdout>,
}
impl Racket {
    pub fn new() -> Result<Self, RacketError> {
        let child = Command::new("racket")
            .arg("src/loader.rkt")
            .stdin(Stdio::piped())
            .stdout(Stdio::piped())
            .stderr(Stdio::null())
            .spawn()
            .map_err(|_| RacketError::InitializeFailure)?;
        let stdin = child.stdin.ok_or(RacketError::NoPipe)?;
        let stdout = child.stdout.ok_or(RacketError::NoPipe)?;
        Ok(Racket {
            stdin: stdin,
            stdout: BufReader::new(stdout),
        })
    }

    pub fn execute(&mut self, op: serde_json::Value) -> Result<String, RacketError> {
        self.stdin.write_all(op.to_string().as_bytes())?;
        self.stdin.write_all(b"\n\n")?;
        self.stdin.flush()?;
        // println!("wrote to racket: {}", op.to_string());
        let mut s = String::new();
        self.stdout.read_line(&mut s)?;
        // print!("read from racket: {}", s);
        Ok(s)
    }
}

pub enum InsertError {}

pub struct Store {
    g: DiGraph,
}
impl Store {
    fn new() -> Result<Self, graph::Error> {
        let f = File::open("routines.graph")?;
        let g = DiGraph::load(BufReader::new(f))?;
        Ok(Store { g })
    }

    pub fn find(&self, count: u32) -> Result<Vec<String>, ()> {
        Ok(self.g.names.iter().take(count as usize).cloned().collect())
    }
}

pub struct RoutineBuilder {
    id: String,
    description: Option<String>,
    documentation: Option<String>,
    examples: Option<Box<[Input]>>,
    // sexp:
    evaluator: String, // Input -> Output
    generator: String, // RNG -> Input
    validator: Option<String>, // Input -> bool

        // parameterized_generator: Option<String>,
        // example_parameters: Option<Box<[Input]>>
}
impl RoutineBuilder {
    pub fn new(id: String, evaluator: String, generator: String) -> Self {
        RoutineBuilder {
            id: id,
            description: None,
            documentation: None,
            examples: None,
            evaluator: evaluator,
            generator: generator,
            validator: None,
        }
    }
    pub fn with_description(mut self, desc: String) -> Self {
        self.description = Some(desc);
        self
    }
    pub fn with_documentations(mut self, docs: String) -> Self {
        self.documentation = Some(docs);
        self
    }
    pub fn with_examples(mut self, examples: Box<[Input]>) -> Self {
        self.examples = Some(examples);
        self
    }
    pub fn with_validator(mut self, validator: String) -> Self {
        self.validator = Some(validator);
        self
    }
}

fn routine_path(id: &str) -> String {
    format!("src/routines/{}.rkt", id)
}
