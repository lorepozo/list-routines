extern crate rocket;
extern crate serde;
extern crate serde_json;

use std;
use rocket::{State, http, request, response};
use rocket::response::{Response, Responder};
use routine::{Manager, Input};

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
        .map(|j| {
            JsonResponse(
                http::Status::Ok,
                json!({
                    "result": j
                }),
            )
        })
        .unwrap_or_else(|_| response_internal_server_error())
}

#[derive(Copy, Clone, FromForm)]
struct FindForm {
    count: Option<u32>,
}

#[derive(Copy, Clone, FromForm)]
struct GenerateForm {
    count: Option<u32>,
}

#[get("/find?<form>")]
fn find(mgr: State<Manager>, form: FindForm) -> JsonResponse {
    mgr.store
        .read()
        .unwrap()
        .find(form.count.unwrap_or(DEFAULT_FIND_COUNT))
        .map(response_ok)
        .unwrap_or_else(|_| response_internal_server_error())
}

#[get("/examples/<id>")]
fn examples(mgr: State<Manager>, id: String) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or_else(response_not_found)
        .and_then(|routine| {
            routine
                .examples()
                .map_err(|e| {
                    JsonResponse(
                        http::Status::InternalServerError,
                        json!({
                            "error": format!("{}", e)
                        }),
                    )
                })
                .map(response_ok)
        })
        .unwrap_or_else(|e| e)
}

#[get("/gen/<id>?<form>")]
fn gen(mgr: State<Manager>, id: String, form: GenerateForm) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or_else(response_not_found)
        .and_then(|routine| {
            routine
                .generate(form.count.unwrap_or(DEFAULT_GENERATE_COUNT))
                .map_err(|e| {
                    JsonResponse(
                        http::Status::InternalServerError,
                        json!({
                            "error": format!("{}", e)
                        }),
                    )
                })
                .map(response_ok)
        })
        .unwrap_or_else(|e| e)
}

#[post("/eval/<id>", data = "<input>")]
fn eval(mgr: State<Manager>, id: String, input: Input) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or_else(response_not_found)
        .and_then(|routine| {
            routine
                .evaluate(input)
                .map_err(|e| {
                    JsonResponse(
                        http::Status::InternalServerError,
                        json!({
                            "error": format!("{}", e)
                        }),
                    )
                })
                .and_then(|output| {
                    output.ok_or_else(response_bad_request).map(response_ok)
                })
        })
        .unwrap_or_else(|e| e)
}

#[catch(400)]
fn bad_request() -> JsonResponse {
    response_bad_request()
}
#[catch(404)]
fn not_found() -> JsonResponse {
    response_not_found()
}
#[catch(500)]
fn internal_server_error() -> JsonResponse {
    response_internal_server_error()
}

pub fn rocket() -> rocket::Rocket {
    rocket::ignite()
        .mount("/", routes![find, gen, examples, eval])
        .manage(Manager::new().expect("initialize routine manager"))
        .catch(catchers![bad_request, not_found, internal_server_error])
}
