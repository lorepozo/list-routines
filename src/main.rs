extern crate listroutines;
extern crate rocket;

use listroutines::api;

fn main() {
    api::mount(rocket::ignite()).launch();
}
