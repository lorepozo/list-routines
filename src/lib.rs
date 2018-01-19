//! # List Routines
//!
//! This is a dataset for program learning. The routines in this dataset take in
//! one of a number, list of numbers, or list of lists of numbers, and the
//! output is either a Boolean, number, or list of numbers.
//!
//! ```text
//! INPUT:   Num | List<Num> | List<List<Num>>
//! OUTPUT:  Bool | Num | List<Num>
//! ROUTINE: INPUT => OUTPUT
//! ```
//!
//! This dataset is in the form of a web server.

#![feature(plugin, custom_derive, decl_macro)]
#![plugin(rocket_codegen)]

extern crate itertools;
extern crate rocket;
extern crate serde;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate serde_json;
extern crate workerpool;

pub mod api;
pub mod graph;
pub mod routine;

use std::fs::File;
use std::io::ErrorKind;
use std::process::Command;

pub fn ensure_routine_loader() {
    let f = File::open("src/racket/loader");
    if f.is_ok() {
        return;
    }
    let e = f.unwrap_err();
    if e.kind() != ErrorKind::NotFound {
        panic!(e)
    }

    eprintln!("Routine loader binary not found. Compiling...");
    let status = Command::new("raco")
        .arg("exe")
        .arg("src/racket/loader.rkt")
        .status()
        .expect("failed to start raco, racket might not be installed");

    if status.success() {
        eprintln!("Successfully compiled routine loader");
    } else {
        panic!(
            "Failed to compile loader using `raco exe src/racket/loader.rkt`: code {}",
            status
        )
    }
}
