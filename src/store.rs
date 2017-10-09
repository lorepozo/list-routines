#![allow(dead_code)]
#![allow(unused_variables)]

use futures::future::{self, Future};

use routine::{Id, Input, Output};

pub struct ListRoutineStore;

impl ListRoutineStore {
    pub fn find(&self, _count: u32) -> Vec<Id> {
        // TODO: more params
        vec![Id::from("len")]
    }
    pub fn generate(&self, id: &str, _count: u32) -> Vec<Input> {
        // TODO more params
        vec![Input::Array(vec![1, 2, 3])]
    }
    pub fn evaluate(
        &self,
        id: &str,
        _inp: &[u8],
    ) -> Box<Future<Item = Option<Output>, Error = ()>> {
        match id {
            // query routine
            "len" => {
                // validate
                if true {
                    Box::new(future::ok(Some(
                        // evaluate
                        Output::Number(3),
                    )))
                } else {
                    Box::new(future::ok(None))
                }
            }
            _ => Box::new(future::err(())),
        }
    }
}
