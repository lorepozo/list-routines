#![feature(plugin,custom_derive,decl_macro)]
#![plugin(rocket_codegen)]

#[macro_use]
extern crate lazy_static;
extern crate rocket;
extern crate serde;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate serde_json;

mod routine;
mod api;

fn main() {
    api::rocket().launch();
}
