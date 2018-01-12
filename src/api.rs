//! # API
//!
//! Most of this module is boilerplate.
//! See the api functions [`eval`], [`example`], [`find`], and [`gen`] for details.
//!
//! [`eval`]: fn.eval.html
//! [`example`]: fn.example.html
//! [`find`]: fn.find.html
//! [`gen`]: fn.gen.html

use std::io::Cursor;

use itertools::Itertools;
use rocket::{self, request, response};
use rocket::request::FromForm;
use rocket::http::{ContentType, Status};
use rocket::State;
use serde::Serialize;
use serde_json;

use routine::{EvalInput, Input, Manager};

/// A find request without an explicitly specified count will return up to this
/// many items.
const DEFAULT_FIND_COUNT: u32 = 1;

/// Encodes a json object for use in a query string.
///
/// ```
/// #[macro_use] extern crate serde_json;
/// # extern crate listroutines;
/// # fn main() {
///
/// use listroutines::api::urlencode;
///
/// let json = json!({"n": 12, "s": "hello"});
/// let map = match json {
///     serde_json::Value::Object(obj) => obj,
///     _ => unreachable!(),
/// };
/// let url_encoded = urlencode(map);
/// assert_eq!(url_encoded, "n=12&s=hello");
/// # }
/// ```
pub fn urlencode(map: serde_json::Map<String, serde_json::Value>) -> String {
    map.into_iter()
        .map(|(k, v)| match v {
            serde_json::Value::String(s) => format!("{}={}", k, s),
            _ => format!("{}={}", k, v),
        })
        .join("&")
}

/// An http redirect response.
#[derive(Clone, Debug)]
struct Redirect(Status, String);
impl<'r> response::Responder<'r> for Redirect {
    fn respond_to(self, _: &request::Request) -> response::Result<'r> {
        Ok(response::Response::build()
            .status(self.0)
            .raw_header("Location", self.1)
            .finalize())
    }
}

/// An http response comprising of JSON data.
#[derive(Clone, Debug)]
struct JsonResponse(Status, serde_json::Value);
impl<'r> response::Responder<'r> for JsonResponse {
    fn respond_to(self, _: &request::Request) -> response::Result<'r> {
        Ok(response::Response::build()
            .status(self.0)
            .header(ContentType::JSON)
            .sized_body(Cursor::new(self.1.to_string()))
            .finalize())
    }
}
impl<T: Serialize> From<T> for JsonResponse {
    fn from(v: T) -> JsonResponse {
        serde_json::to_value(v)
            .map(|j| JsonResponse(Status::Ok, json!({ "result": j })))
            .unwrap_or_else(|_| {
                JsonResponse(
                    Status::InternalServerError,
                    json!({"error": "could not serialize result"}),
                )
            })
    }
}

/// A generic form for key-value pairs.
/// Recommended usage is either to iterate over its `items` or to use `.into()`
/// to create a `serde_json::Map`.
struct Form<'a> {
    items: request::FormItems<'a>,
}
impl<'a> From<Form<'a>> for serde_json::Value {
    fn from(f: Form<'a>) -> serde_json::Value {
        serde_json::Value::Object(
            f.items
                .map(|x| {
                    let key = x.0.as_str();
                    let value = x.1.as_str();
                    let json_value = if let Ok(n) = x.1.as_str().parse::<i32>() {
                        serde_json::Value::Number(n.into())
                    } else {
                        serde_json::Value::String(String::from(value))
                    };
                    (String::from(key), json_value)
                })
                .collect(),
        )
    }
}
impl<'a, 'r> request::FromRequest<'a, 'r> for Form<'a> {
    type Error = ();
    fn from_request(r: &'a request::Request<'r>) -> request::Outcome<Form<'a>, ()> {
        rocket::Outcome::Success(Form {
            items: r.uri().query().unwrap_or("").into(),
        })
    }
}

/// Specifies fields for use with the `/find` endpoint.
#[derive(Clone, FromForm)]
struct FindForm {
    count: Option<u32>,
    depends_on: Option<String>,
    depended_on_by: Option<String>,
}

/// The `/find` endpoint, via GET, returns a list of ids of routines in the
/// dataset.
///
/// It currently takes (optionally) one query argument, `count`: e.g.
/// `/find?count=2`.
///
/// Eventually support will be added for more constraints on finding.
#[get("/find")]
fn find(mgr: State<Manager>, mut form: Form) -> JsonResponse {
    let form = match FindForm::from_form(&mut form.items, false) {
        Ok(f) => f,
        Err(_) => return JsonResponse(Status::BadRequest, json!({"error": "invalid query"})),
    };
    mgr.find(
        form.count.unwrap_or(DEFAULT_FIND_COUNT),
        form.depends_on,
        form.depended_on_by,
    ).map_err(|_| {
            JsonResponse(
                Status::InternalServerError,
                json!({"error": "find operation failed"}),
            )
        })
        .map(Into::into)
        .unwrap_or_else(|e| e)
}

/// The `/description/<id>` endpoint, via GET, returns text of the
/// documentation for the given routine.
#[get("/description/<id>")]
fn description(mgr: State<Manager>, id: String) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .description()
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

/// The `/is-parametric/<id>` endpoint, via GET, returns text of the
/// documentation for the given routine.
#[get("/is-parametric/<id>")]
fn is_parametric(mgr: State<Manager>, id: String) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .is_parametric()
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

/// The `/examples/<id>` endpoint, via GET, returns a list of INPUTs for the
/// given routine. These inputs should be representative of the routine's
/// function.
#[get("/examples/<id>")]
fn examples(mgr: State<Manager>, id: String) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .examples()
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

/// The `/example-params/<id>` endpoint, via GET, returns a list of key-value
/// mappings of parameters and their assignments for the given parametric
/// routine. These parameters should provide representative functions for the
/// routine's concept.
#[get("/example-params/<id>")]
fn example_params(mgr: State<Manager>, id: String) -> JsonResponse {
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .example_params()
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

/// The `/gen/<id>` endpoint, via GET, returns a list of INPUTs for the routine
/// that have been randomly generated.
///
/// It currently takes (optionally) one query argument, count: e.g.
/// `/gen/len?count=3`.
#[get("/gen/<id>")]
fn gen(mgr: State<Manager>, id: String, form: Form) -> JsonResponse {
    let params: serde_json::Value = form.into();
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .generate(params)
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
                    )
                })
                .map(Into::into)
        })
        .unwrap_or_else(|e| e)
}

/// The `/eval/<id>` endpoint, via POST, takes in json data representing input
/// for the routine, and returns an OUTPUT. Invalid input for the routine
/// results in a bad request error (HTTP 400).
#[post("/eval/<id>", data = "<input>")]
fn eval(mgr: State<Manager>, id: String, form: Form, input: Input) -> JsonResponse {
    let params: serde_json::Value = form.into();
    mgr.open_routine(id)
        .ok_or(JsonResponse(
            Status::NotFound,
            json!({"error": "not found"}),
        ))
        .and_then(|routine| {
            routine
                .evaluate(EvalInput::new(input, params))
                .map_err(|e| {
                    JsonResponse(
                        Status::InternalServerError,
                        json!({ "error": format!("{}", e) }),
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

#[error(400)]
fn catch_bad_request() -> JsonResponse {
    JsonResponse(Status::BadRequest, json!({"error": "bad request"}))
}
#[error(404)]
fn catch_not_found() -> JsonResponse {
    JsonResponse(Status::NotFound, json!({"error": "not found"}))
}
#[error(500)]
fn catch_internal_server_error() -> JsonResponse {
    JsonResponse(
        Status::InternalServerError,
        json!({"error": "internal server error"}),
    )
}

/// The root endpoint simply redirects to the project homepage,
/// [lucasem.github.io/list-routines].
///
/// [lucasem.github.io/list-routines]: https://lucasem.github.io/list-routines/
#[get("/")]
fn homepage_redirect() -> Redirect {
    Redirect(
        Status::PermanentRedirect,
        String::from("https://lucasem.github.io/list-routines"),
    )
}

/// Attaches the api to the root of the given `Rocket` instance.
pub fn mount(r: rocket::Rocket) -> rocket::Rocket {
    r.mount(
        "/",
        routes![
            homepage_redirect,
            find,
            description,
            is_parametric,
            examples,
            example_params,
            gen,
            eval
        ],
    ).manage(Manager::new().expect("initialize routine manager"))
        .catch(errors![
            catch_bad_request,
            catch_not_found,
            catch_internal_server_error
        ])
}
