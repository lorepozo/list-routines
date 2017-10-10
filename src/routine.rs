#![allow(dead_code)]

use serde_json;
use rocket::Outcome;
use rocket::http::Status;
use rocket::data::{self, Data, FromData};
use rocket::request::Request;

pub struct RacketError;

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
}
impl Routine {
    pub fn open(id: String) -> Result<Routine, ()> {
        match &*id {
            "len" => Ok(Routine { id }),
            _ => Err(())
        }
    }

    /// Validates and executes the input for the routine. Invalid input will give Ok(None).
    pub fn execute(&self, inp: Input) -> Result<Option<Output>, RacketError> {
        match inp {
            Input::Array(l) => Ok(Some(Output::Number(l.len() as i32))),
            _ => Ok(None),
        }
    }

    /// Gives the examples of valid inputs for the routine.
    pub fn examples(&self) -> Result<Vec<Input>, RacketError> {
        Ok(vec![Input::Array(vec![1, 2, 3]), Input::Array(vec![1, 1])])
    }

    /// Generates a given number of valid inputs for the routine.
    pub fn generate(&self, _count: u32) -> Result<Vec<Input>, RacketError> {
        Ok((0.._count).map(|_| Input::Array(vec![1, 2, 2, 1])).collect())
    }
}

pub mod store {
    use super::{Routine, Input};
    use std::io;

    pub enum InsertError {
        NotYetImplemented,
        InvalidId,
        IO(io::Error),
    }
    impl From<io::Error> for InsertError {
        fn from(e: io::Error) -> InsertError {
            InsertError::IO(e)
        }
    }
    pub enum FindError {
        NotYetImplemented,
        IO(io::Error),
    }
    impl From<io::Error> for FindError {
        fn from(e: io::Error) -> FindError {
            FindError::IO(e)
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

        pub fn save(self) -> Result<Routine, InsertError> {
            // TODO
            Err(InsertError::NotYetImplemented)
        }
    }

    pub fn find(_count: u32) -> Result<Vec<String>, FindError> {
        // TODO: more params
        Ok(vec!["len".to_string()])
    }
}
