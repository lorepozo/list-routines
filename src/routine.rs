#[derive(Serialize, Deserialize, Debug)]
pub struct Id {
    id: String,
}
impl<'a> From<&'a str> for Id {
    fn from(s: &'a str) -> Id {
        Id { id: s.into() }
    }
}
impl From<String> for Id {
    fn from(id: String) -> Id {
        Id { id }
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
pub enum Input {
    Number(i32),
    Array(Vec<i32>),
    NestedArray(Vec<Vec<i32>>),
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
pub enum Output {
    Bool(bool),
    Number(i32),
    Array(Vec<i32>),
}
