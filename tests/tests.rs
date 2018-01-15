extern crate listroutines;
extern crate rocket;
extern crate serde;
#[macro_use]
extern crate serde_derive;
extern crate serde_json;

use rocket::local::{Client, LocalResponse};
use rocket::http::Status;
use rocket::config::{Config, Environment, LoggingLevel};
use serde::de::DeserializeOwned;

use listroutines::api::{self, urlencode};
use listroutines::routine::{Input, Output};

const FIND_COUNT: u32 = 100;
const GENERATE_COUNT: u32 = 3;

#[derive(Deserialize)]
struct OutputCarrier {
    result: Option<serde_json::Value>,
    error: Option<String>,
}

fn json_resp<T: DeserializeOwned>(mut resp: LocalResponse, path: &str) -> T {
    let body = resp.body()
        .expect(&format!("get body {}", path))
        .into_bytes()
        .expect(&format!("read body {}", path));
    let output: OutputCarrier =
        serde_json::from_slice(&body).expect(&format!("parse body {}", path));
    if let Some(e) = output.error {
        panic!("unexpected error response for {}: {}", path, e);
    }
    assert_eq!(Status::Ok, resp.status());
    serde_json::from_value(output.result.unwrap()).expect(&format!("parse expected type {}", path))
}

fn json_get<T: DeserializeOwned>(client: &Client, path: &str) -> T {
    let resp = client.get(path).dispatch();
    json_resp(resp, path)
}

fn json_post<T: DeserializeOwned, S: AsRef<[u8]>>(client: &Client, path: &str, body: S) -> T {
    let resp = client.post(path).body(body).dispatch();
    json_resp(resp, path)
}

fn connect_to_new_server() -> Client {
    let config = Config::build(Environment::Staging)
        .log_level(LoggingLevel::Critical)
        .finalize()
        .unwrap();
    let rocket = api::mount(rocket::custom(config, true));
    Client::new(rocket).expect("connect to server")
}

#[test]
fn routines() {
    let client = connect_to_new_server();

    let path = format!("/find?count={}", FIND_COUNT);
    let routines: Vec<String> = json_get(&client, &path);
    for routine in routines.into_iter() {
        // if !routine.starts_with("rot") {continue}
        let path = format!("/is-parametric/{}", &routine);
        let is_parametric: bool = json_get(&client, &path);

        if is_parametric {
            let path = format!("/example-params/{}", &routine);
            let example_params: Vec<serde_json::Map<String, serde_json::Value>> =
                json_get(&client, &path);
            for example_param in example_params.into_iter() {
                eprintln!(
                    "{}(example-param): {}",
                    &routine,
                    serde_json::to_string(&example_param).unwrap(),
                );
                let url_param = urlencode(example_param);
                let path = format!("/gen/{}?count={}&{}", &routine, GENERATE_COUNT, &url_param);
                let gen_inputs: Vec<Input> = json_get(&client, &path);
                for inp in gen_inputs.into_iter() {
                    let path = format!("/eval/{}?{}", &routine, &url_param);
                    let output: Output =
                        json_post(&client, &path, serde_json::to_vec(&inp).unwrap());
                    eprintln!(
                        "{}(generated)[{}]: {} -> {}",
                        &routine,
                        &url_param,
                        serde_json::to_string(&inp).unwrap(),
                        serde_json::to_string(&output).unwrap()
                    )
                }
            }
        } else {
            let path = format!("/examples/{}", &routine);
            let examples: Vec<Input> = json_get(&client, &path);
            for example in examples.into_iter() {
                let path = format!("/eval/{}", routine);
                let output: Output =
                    json_post(&client, &path, serde_json::to_vec(&example).unwrap());
                eprintln!(
                    "{}(example): {} -> {}",
                    &routine,
                    serde_json::to_string(&example).unwrap(),
                    serde_json::to_string(&output).unwrap()
                )
            }

            let path = format!("/gen/{}?count={}", &routine, GENERATE_COUNT);
            let gen_inputs: Vec<Input> = json_get(&client, &path);
            for inp in gen_inputs.into_iter() {
                let path = format!("/eval/{}", &routine);
                let output: Output = json_post(&client, &path, serde_json::to_vec(&inp).unwrap());
                eprintln!(
                    "{}(generated): {} -> {}",
                    &routine,
                    serde_json::to_string(&inp).unwrap(),
                    serde_json::to_string(&output).unwrap()
                )
            }
        }
    }
}
