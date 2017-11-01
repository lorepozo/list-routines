use std::collections::HashMap;
use std::fmt;
use std::fs::File;
use std::io::prelude::*;
use std::io::{self, BufReader};
use std::process::{Command, ChildStdin, ChildStdout, Stdio};
use std::sync::{Arc, Mutex, RwLock};

use rocket::{Outcome, Request};
use rocket::data::{self, Data, FromData};
use rocket::http::Status;
use serde_json;

use graph::{self, DiGraph};

pub struct Manager {
    pub rkt: Arc<Mutex<Racket>>,
    pub store: Arc<RwLock<Store>>,
}
impl Manager {
    pub fn new() -> Result<Self, ()> {
        let rkt = Racket::new().unwrap();
        let store = Store::new().unwrap();
        Ok(Manager {
            rkt: Arc::new(Mutex::new(rkt)),
            store: Arc::new(RwLock::new(store)),
        })
    }
    pub fn open_routine(&self, id: String) -> Option<Routine> {
        if self.store.read().unwrap().g.names.contains(&id) {
            let rkt = Arc::clone(&self.rkt);
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
    InvalidJson,
    IO(io::Error),
}
impl fmt::Display for RacketError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            RacketError::InitializeFailure => write!(f, "failed to initialize racket"),
            RacketError::NoPipe => write!(f, "failed to connect pipe to racket"),
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
    rkt: Arc<Mutex<Racket>>,
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
    pub fn generate(&self, params: HashMap<&str, &str>) -> Result<Vec<Input>, RacketError> {
        let params: serde_json::Value = json!(params);
        let op = json!({
            "op": "generate",
            "routine": &self.id,
            "params": params,
        });
        self.rkt.lock().unwrap().execute(op).and_then(|s| {
            serde_json::from_str(&s).map_err(|_| RacketError::InvalidJson)
        })
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
            .stderr(Stdio::inherit())
            .spawn()
            .map_err(|_| RacketError::InitializeFailure)?;
        let stdin = child.stdin.ok_or(RacketError::NoPipe)?;
        let stdout = child.stdout.ok_or(RacketError::NoPipe)?;
        let stdout = BufReader::new(stdout);
        Ok(Racket { stdin, stdout })
    }

    pub fn execute(&mut self, op: serde_json::Value) -> Result<String, RacketError> {
        self.stdin.write_all(op.to_string().as_bytes())?;
        self.stdin.write_all(b"\n")?;
        self.stdin.flush()?;
        let mut s = String::new();
        self.stdout.read_line(&mut s)?;
        Ok(s)
    }
}

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

#[allow(dead_code)]
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
#[allow(dead_code)]
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
