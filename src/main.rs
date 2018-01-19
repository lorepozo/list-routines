extern crate listroutines;
extern crate rocket;

use listroutines::ensure_routine_loader;
use listroutines::api;

fn main() {
    ensure_routine_loader();
    api::mount(rocket::ignite()).launch();
}
