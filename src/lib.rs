//! # List Routines
//!
//! This is a dataset for program learning. The routines in this dataset take in
//! one of a number, list of numbers, or list of lists of numbers, and the
//! output is either a Boolean, number, or list of numbers.
//!
//! ```
//! INPUT:   Num | List<Num> | List<List<Num>>
//! OUTPUT:  Bool | Num | List<Num>
//! ROUTINE: INPUT => OUTPUT
//! ```
//!
//! This dataset is in the form of a web server.

#![feature(plugin,custom_derive,decl_macro)]
#![plugin(rocket_codegen)]

extern crate itertools;
extern crate rocket;
extern crate serde;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate serde_json;

pub mod api;
pub mod graph;
pub mod routine;
