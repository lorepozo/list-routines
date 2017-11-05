//! # Routine
//!
//! This module is responsible for the core functionality of the list-routines
//! dataset.
//!
//! The [`Manager`] struct is the primary entrypoint for getting started. It
//! maintains an interactive connection to the Racket runtime and it maintains a
//! [`Store`] that keeps track of all routines.
//!
//! A [`Routine`] allows interacting with the Racket runtime for a particular
//! routine.
//!
//! [`Manager`]: struct.Manager.html
//! [`Routine`]: struct.Routine.html
//! [`Store`]: struct.Store.html

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

/// The error type for list routine operations.
#[derive(Debug)]
pub enum Error {
    /// When a graph fails to load.
    Graph(graph::Error),
    /// When racket fails to initialize.
    InitializeFailure,
    /// When racket responds with invalid JSON.
    InvalidJson,
    /// When the connection to racket is broken.
    NoPipe,
    /// Other IO-related error.
    IO(io::Error),
}
impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            Error::Graph(ref err) => write!(f, "Graph error: {}", err),
            Error::InitializeFailure => write!(f, "failed to initialize racket"),
            Error::InvalidJson => write!(f, "racket gave invalid json"),
            Error::NoPipe => write!(f, "failed to connect pipe to racket"),
            Error::IO(ref err) => write!(f, "IO error: {}", err),
        }
    }
}
impl ::std::error::Error for Error {
    fn description(&self) -> &str {
        "list-routine error"
    }
}
impl From<graph::Error> for Error {
    fn from(err: graph::Error) -> Error {
        Error::Graph(err)
    }
}
impl From<io::Error> for Error {
    fn from(err: io::Error) -> Error {
        Error::IO(err)
    }
}


/// The `Manager` governs the dataset. It maintains the interactive racket
/// connection as well as list routine storage. It is used to interact with
/// particular list routines via the [`open_routine`] function.
///
/// ## Examples
///
/// Find some routines:
///
/// ```
/// let routine_names = mgr.store()
///                        .read()
///                        .expect("poisoned lock")
///                        .find(4)
///                        .unwrap();
/// ```
///
/// Evaluate a routine:
///
/// ```
/// let routine_name = String::from("evens");
/// let inp = vec![1, 2, 8, 5, 3];
/// let routine = mgr.open_routine(routine_name)
///                  .expect("routine not found");
/// let out = routine.evaluate(inp)
///                  .expect("internal error");
/// assert_eq!(out, Some(Output::Array(vec![2, 8])));
/// ```
///
/// [`open_routine`]: fn.open_routine.html
pub struct Manager {
    rkt: Arc<Mutex<Racket>>,
    pub store: Arc<RwLock<Store>>,
}
impl Manager {
    /// Initializes a new Manager, connecting to a new rocket instance and
    /// setting up list-routine storage.
    pub fn new() -> Result<Self, Error> {
        let rkt = Racket::new()?;
        let store = Store::new()?;
        Ok(Manager {
            rkt: Arc::new(Mutex::new(rkt)),
            store: Arc::new(RwLock::new(store)),
        })
    }
    /// Gets the routine if it exists.
    pub fn open_routine(&self, id: String) -> Option<Routine> {
        if self.store
            .read()
            .expect("store rwlock is poisoned")
            .g
            .names
            .contains(&id)
        {
            let rkt = Arc::clone(&self.rkt);
            Some(Routine { id, rkt })
        } else {
            None
        }
    }
}


/// All inputs must be of one of these forms.
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

/// All outputs must be of one of these forms.
#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
pub enum Output {
    Bool(bool),
    Number(i32),
    Array(Vec<i32>),
}

/// Allows interaction with the a routine. Created by a [`Manager`].
///
/// ## Examples
///
/// ```
/// let routine_name = "len";
/// let routine = mgr.open_routine(routine_name)
///                  .expect("routine not found");
/// // evaluation
/// assert_eq!(
///   routine.evaluate(Input::Array(vec![1, 1])).unwrap(),
///   Some(Output::Number(2)),
/// );
/// // examples
/// for inp in routine.examples().unwrap() {
///   // must be valid (Some)
///   assert!(routine.evaluate(inp).unwrap().is_some());
/// }
/// ```
///
/// [`Manager`]: struct.Manager.html
pub struct Routine {
    id: String,
    rkt: Arc<Mutex<Racket>>,
}
impl Routine {
    /// Validates and executes the input for the routine. Invalid input will
    /// give Ok(None).
    pub fn evaluate(&self, inp: Input) -> Result<Option<Output>, Error> {
        let op = json!({
            "op": "evaluate",
            "routine": &self.id,
            "input": inp,
        });
        self.rkt
            .lock()
            .expect("racket mutex is poisoned")
            .execute(op)
            .and_then(|s| serde_json::from_str(&s).map_err(|_| Error::InvalidJson))
    }

    /// Gives the examples of valid inputs for the routine.
    pub fn examples(&self) -> Result<Vec<Input>, Error> {
        let op = json!({
            "op": "examples",
            "routine": &self.id,
        });
        self.rkt
            .lock()
            .expect("racket mutex is poisoned")
            .execute(op)
            .and_then(|s| serde_json::from_str(&s).map_err(|_| Error::InvalidJson))
    }

    /// Generates a given number of valid inputs for the routine.
    pub fn generate(&self, params: HashMap<&str, &str>) -> Result<Vec<Input>, Error> {
        let params: serde_json::Value = json!(params);
        let op = json!({
            "op": "generate",
            "routine": &self.id,
            "params": params,
        });
        self.rkt
            .lock()
            .expect("racket mutex is poisoned")
            .execute(op)
            .and_then(|s| serde_json::from_str(&s).map_err(|_| Error::InvalidJson))
    }
}

/// Maintains the interactive connection to a racket runtime.
struct Racket {
    stdin: ChildStdin,
    stdout: BufReader<ChildStdout>,
}
impl Racket {
    fn new() -> Result<Self, Error> {
        let child = Command::new("racket")
            .arg("src/loader.rkt")
            .stdin(Stdio::piped())
            .stdout(Stdio::piped())
            .stderr(Stdio::inherit())
            .spawn()
            .map_err(|_| Error::InitializeFailure)?;
        let stdin = child.stdin.ok_or(Error::NoPipe)?;
        let stdout = child.stdout.ok_or(Error::NoPipe)?;
        let stdout = BufReader::new(stdout);
        Ok(Racket { stdin, stdout })
    }

    /// Communication with racket is done via lines of back-and-forth JSON. This
    /// function serializes a given JSON operation and send it along, returning
    /// the raw JSON string back if successful.
    ///
    /// Consult `loader.rkt` to see the valid operations.
    fn execute(&mut self, op: serde_json::Value) -> Result<String, Error> {
        self.stdin.write_all(op.to_string().as_bytes())?;
        self.stdin.write_all(b"\n")?;
        self.stdin.flush()?;
        let mut s = String::new();
        self.stdout.read_line(&mut s)?;
        Ok(s)
    }
}

/// Store maintains a graph of the list routines.
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

/*
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
*/
