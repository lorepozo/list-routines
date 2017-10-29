extern crate rocket;
extern crate serde;
extern crate serde_json;

use rocket::response::{Response, Responder};
use rocket::{State, http, request, response};
use routine::{Manager, Input};
use std;

const DEFAULT_FIND_COUNT: u32 = 1;
const DEFAULT_GENERATE_COUNT: u32 = 1;

/// An http response comprising of JSON data.
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
impl<T: serde::Serialize> From<T> for JsonResponse {
    fn from(v: T) -> JsonResponse {
        serde_json::to_value(v)
            .map(|j| {
                JsonResponse(
                    http::Status::Ok,
                    json!({
                        "result": j
                    }),
                )
            })
            .unwrap_or_else(|_| {
                JsonResponse(
                    http::Status::InternalServerError,
                    json!({"error": "could not serialize result"}),
                )
            })
    }
}

fn response_not_found() -> JsonResponse {
    JsonResponse(http::Status::NotFound, json!({"error": "not found"}))
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
        .map_err(|_| {
            JsonResponse(
                http::Status::InternalServerError,
                json!({"error": "find operation failed"}),
            )
        })
        .map(Into::into)
        .unwrap_or_else(|e| e)
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
                .map(Into::into)
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
                .map(Into::into)
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
                .and_then(|result| {
                    result
                        .ok_or_else(|| {
                            JsonResponse(
                                http::Status::BadRequest,
                                json!({"error": "invalid routine input"}),
                            )
                        })
                        .map(Into::into)
                })
        })
        .unwrap_or_else(|e| e)
}

#[catch(400)]
fn bad_request() -> JsonResponse {
    JsonResponse(http::Status::BadRequest, json!({"error": "bad request"}))
}
#[catch(404)]
fn not_found() -> JsonResponse {
    response_not_found()
}
#[catch(500)]
fn internal_server_error() -> JsonResponse {
    JsonResponse(
        http::Status::InternalServerError,
        json!({"error": "internal server error"}),
    )
}

pub fn mount(r: rocket::Rocket) -> rocket::Rocket {
    r.mount("/", routes![find, gen, examples, eval])
        .manage(Manager::new().expect("initialize routine manager"))
        .catch(catchers![bad_request, not_found, internal_server_error])
}
