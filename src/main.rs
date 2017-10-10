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

use rocket::{http, request, response};
use rocket::response::{Response, Responder};
use routine::{store, Input, Routine};

const DEFAULT_FIND_COUNT: u32 = 1;
const DEFAULT_GENERATE_COUNT: u32 = 1;

#[derive(Clone, Debug)]
struct JsonResponse(http::Status, serde_json::Value);
impl<'r> Responder<'r> for JsonResponse {
    fn respond_to(self, _: &request::Request) -> response::Result<'r> {
        Ok(
            Response::build()
                .status(self.0)
                .header(http::ContentType::JSON)
                .sized_body(std::io::Cursor::new(self.1.to_string()))
                .finalize(),
        )
    }
}

lazy_static! {
    static ref JSON_INTERNAL_SERVER_ERROR: serde_json::Value = json!({"error": "internal server error"});
    static ref JSON_NOT_FOUND: serde_json::Value = json!({"error": "not found"});
    static ref JSON_BAD_REQUEST: serde_json::Value = json!({"error": "bad request"});
}
fn response_internal_server_error() -> JsonResponse {
    JsonResponse(
        http::Status::InternalServerError,
        JSON_INTERNAL_SERVER_ERROR.clone(),
    )
}
fn response_not_found() -> JsonResponse {
    JsonResponse(http::Status::NotFound, JSON_NOT_FOUND.clone())
}
fn response_bad_request() -> JsonResponse {
    JsonResponse(http::Status::BadRequest, JSON_BAD_REQUEST.clone())
}
fn response_ok<T: serde::Serialize>(v: T) -> JsonResponse {
    serde_json::to_value(v)
        .map(|j| JsonResponse(http::Status::Ok, j))
        .unwrap_or_else(|_| response_internal_server_error())
}

#[derive(FromForm)]
struct FindForm {
    count: Option<u32>,
}

#[derive(FromForm)]
struct GenerateForm {
    count: Option<u32>,
}

#[get("/find?<form>")]
fn find(form: FindForm) -> JsonResponse {
    store::find(form.count.unwrap_or(DEFAULT_FIND_COUNT))
        .map(response_ok)
        .unwrap_or_else(|_| response_internal_server_error())
}

#[get("/examples/<id>")]
fn examples(id: String) -> JsonResponse {
    Routine::open(id)
        .map_err(|_| response_not_found())
        .and_then(|routine| {
            routine
                .examples()
                .map_err(|_| response_internal_server_error())
                .map(response_ok)
        })
        .unwrap_or_else(|e| e)
}

#[get("/gen/<id>?<form>")]
fn gen(id: String, form: GenerateForm) -> JsonResponse {
    Routine::open(id)
        .map_err(|_| response_not_found())
        .and_then(|routine| {
            routine
                .generate(form.count.unwrap_or(DEFAULT_GENERATE_COUNT))
                .map_err(|_| response_internal_server_error())
                .map(response_ok)
        })
        .unwrap_or_else(|e| e)
}

#[post("/eval/<id>", data = "<input>")]
fn eval(id: String, input: Input) -> JsonResponse {
    Routine::open(id)
        .map_err(|_| response_not_found())
        .and_then(|routine| {
            routine
                .execute(input)
                .map_err(|_| response_internal_server_error())
                .and_then(|output| output.ok_or_else(response_bad_request).map(response_ok))
        })
        .unwrap_or_else(|e| e)
}

#[catch(404)]
fn not_found() -> JsonResponse {
    response_not_found()
}

fn main() {
    rocket::ignite()
        .mount("/", routes![find, gen, examples, eval])
        .catch(catchers![not_found])
        .launch();
}
