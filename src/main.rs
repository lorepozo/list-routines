#[macro_use]
extern crate lazy_static;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate serde_json;
extern crate serde;
extern crate regex;
extern crate futures;
extern crate hyper;

mod store;
mod routine;

use regex::Regex;
use futures::future::{self, Future};
use futures::Stream;
use hyper::server::{Http, Request, Response, Service};
use hyper::{Method, StatusCode};

use store::ListRoutineStore;

lazy_static! {
    static ref FIND_RE: Regex = Regex::new(r#"^/find(/(?P<count>\d+))?$"#).unwrap();
    static ref GEN_RE: Regex = Regex::new(r#"^/gen/(?P<id>\w+)$"#).unwrap();
    static ref EVAL_RE: Regex = Regex::new(r#"^/eval/(?P<id>\w+)$"#).unwrap();
}

struct PathError<'a> {
    path: &'a str,
}
impl<'a> PathError<'a> {
    fn new(path: &'a str) -> Self {
        Self { path }
    }
}
impl<'a> From<PathError<'a>> for Response {
    fn from(pe: PathError<'a>) -> Response {
        let code = StatusCode::NotFound;
        let msg = json!({
            "error": {
                "details": format!("invalid path: {}", pe.path),
                "status": code.as_u16()
            }
        }).to_string();
        Response::new().with_body(msg).with_status(code)
    }
}

macro_rules! basic_error {
    ($name:ident, $code:expr, $details:expr) => {
        struct $name;
        impl From<$name> for Response {
            fn from(_: $name) -> Response {
                let code = $code;
                let msg = json!({
                    "error": {
                        "details": $details,
                        "status": code.as_u16()
                    }
                }).to_string();
                Response::new().with_body(msg).with_status(code)
            }
        }
    }
}

basic_error!(BadRequest,
             StatusCode::BadRequest,
             "bad request");

basic_error!(InvalidInputError,
             StatusCode::BadRequest,
             "invalid routine input");

basic_error!(InternalServerError,
             StatusCode::InternalServerError,
             "internal server error");

impl Service for ListRoutineStore {
    type Error = hyper::Error;
    type Request = Request;
    type Response = Response;
    type Future = Box<Future<Item = Self::Response, Error = Self::Error>>;

    fn call(&self, req: Request) -> Self::Future {
        match req.method() {
            &Method::Post => {
                let path = req.path().to_string();

                if let Some(caps) = EVAL_RE.captures(&path) {
                    let id = caps.name("id").unwrap().as_str();
                    // TODO: cap input
                    Box::new(req.body().concat2().and_then(|inp| {
                        self.evaluate(id, &*inp)
                            .map(|o| if let Some(out) = o {
                                if let Ok(serialized) = serde_json::to_string(&out) {
                                    Response::new().with_body(serialized)
                                } else {
                                    InternalServerError.into()
                                }
                            } else {
                                InvalidInputError.into()
                            })
                            .or_else(|_| future::ok(BadRequest.into())) // TODO: be more precise
                    }))
                } else {
                    Box::new(future::ok(PathError::new(req.path()).into()))
                }
            }
            _ => Box::new(future::ok(PathError::new(req.path()).into())),
        }
    }
}

fn main() {
    let addr = "127.0.0.1:3000".parse().unwrap();
    let server = Http::new().bind(&addr, || Ok(ListRoutineStore)).unwrap();
    server.run().unwrap();
}
