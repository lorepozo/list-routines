extern crate rocket;
extern crate serde;
extern crate serde_json;

use std::collections::HashMap;
use std::io::Cursor;

use rocket::{request, response};
use rocket::request::FromForm;
use rocket::http::{ContentType, Status};
use rocket::State;

use routine::{Input, Manager};

const DEFAULT_FIND_COUNT: u32 = 1;

/// An http response comprising of JSON data.
#[derive(Clone, Debug)]
struct JsonResponse(Status, serde_json::Value);
impl<'r> response::Responder<'r> for JsonResponse {
    fn respond_to(self, _: &request::Request) -> response::Result<'r> {
        Ok(
            response::Response::build()
                .status(self.0)
                .header(ContentType::JSON)
                .sized_body(Cursor::new(self.1.to_string()))
                .finalize(),
        )
    }
}
impl<T: serde::Serialize> From<T> for JsonResponse {
    fn from(v: T) -> JsonResponse {
        serde_json::to_value(v)
            .map(|j| {
                JsonResponse(
                    Status::Ok,
                    json!({
                        "result": j
                    }),
                )
            })
            .unwrap_or_else(|_| {
                JsonResponse(
                    Status::InternalServerError,
                    json!({"error": "could not serialize result"}),
                )
            })
    }
}

struct Form<'a> {
    items: request::FormItems<'a>,
}
impl<'a> From<Form<'a>> for HashMap<&'a str, &'a str> {
    fn from(f: Form<'a>) -> HashMap<&'a str, &'a str> {
        f.items.map(|x| (x.0.as_str(), x.1.as_str())).collect()
    }
}
impl<'a, 'r> request::FromRequest<'a, 'r> for Form<'a> {
    type Error = ();
    fn from_request(r: &'a request::Request<'r>) -> request::Outcome<Form<'a>, ()> {
        rocket::Outcome::Success(Form { items: r.uri().query().unwrap_or("").into() })
    }
}

fn response_not_found() -> JsonResponse {
    JsonResponse(Status::NotFound, json!({"error": "not found"}))
}

#[derive(Copy, Clone, FromForm)]
struct FindForm {
    count: Option<u32>,
}

#[get("/find")]
fn find(mgr: State<Manager>, mut form: Form) -> JsonResponse {
    let form = match FindForm::from_form(&mut form.items, false) {
        Ok(f) => f,
        Err(_) => return JsonResponse(Status::BadRequest, json!({"error": "invalid query"})),
    };
    mgr.store
        .read()
        .unwrap()
        .find(form.count.unwrap_or(DEFAULT_FIND_COUNT))
        .map_err(|_| {
            JsonResponse(
                Status::InternalServerError,
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
                        Status::InternalServerError,
                        json!({
                            "error": format!("{}", e)
                        }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

#[get("/gen/<id>")]
fn gen(mgr: State<Manager>, id: String, form: Form) -> JsonResponse {
    let params: HashMap<&str, &str> = form.into();
    mgr.open_routine(id)
        .ok_or_else(response_not_found)
        .and_then(|routine| {
            routine
                .generate(params)
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
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
                        Status::InternalServerError,
                        json!({
                            "error": format!("{}", e)
                        }),
                    )
                })
                .and_then(|result| {
                    result
                        .ok_or_else(|| {
                            JsonResponse(
                                Status::BadRequest,
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
    JsonResponse(Status::BadRequest, json!({"error": "bad request"}))
}
#[catch(404)]
fn not_found() -> JsonResponse {
    response_not_found()
}
#[catch(500)]
fn internal_server_error() -> JsonResponse {
    JsonResponse(
        Status::InternalServerError,
        json!({"error": "internal server error"}),
    )
}

pub fn mount(r: rocket::Rocket) -> rocket::Rocket {
    r.mount("/", routes![find, gen, examples, eval])
        .manage(Manager::new().expect("initialize routine manager"))
        .catch(catchers![bad_request, not_found, internal_server_error])
}
