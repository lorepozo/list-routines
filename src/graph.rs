extern crate itertools;

use std::fmt;
use std::io::{self, Write, BufRead};
use itertools::Itertools;

#[derive(Debug)]
pub enum GraphError {
    BadFormat,
    IO(io::Error),
}
impl fmt::Display for GraphError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            GraphError::BadFormat => write!(f, "graph error: bad format"),
            GraphError::IO(ref err) => write!(f, "IO error: {}", err),
        }
    }
}
impl ::std::error::Error for GraphError {
    fn description(&self) -> &str {
        match *self {
            GraphError::BadFormat => "graph error: bad format",
            GraphError::IO(ref err) => err.description(),
        }
    }
}
impl From<io::Error> for GraphError {
    fn from(err: io::Error) -> GraphError {
        GraphError::IO(err)
    }
}
impl From<std::num::ParseIntError> for GraphError {
    fn from(_: std::num::ParseIntError) -> GraphError {
        GraphError::BadFormat
    }
}

#[derive(Debug)]
pub struct Graph {
    pub names: Vec<String>,
    pub edges: Vec<Vec<usize>>,
}
impl Graph {
    pub fn to_writer<T: Write>(&self, w: &mut T) -> Result<(), GraphError> {
        w.write_all(self.names.join(" ").as_bytes())?;
        w.write_all(b"\n")?;
        for i in 0..self.edges.len() {
            let v = &self.edges[i];
            if v.is_empty() {
                continue;
            }
            write!(w, "{}: ", i + 1)?;
            w.write_all(
                v.iter().map(|j| format!("{}", j + 1)).join(" ").as_bytes(),
            )?;
            w.write_all(b"\n")?;
        }
        Ok(())
    }

    pub fn deserialize<T: BufRead>(r: T) -> Result<Self, GraphError> {
        let mut lines = r.lines();
        let first_line = lines.next();
        if first_line.is_none() {
            return Err(GraphError::BadFormat);
        }
        let names: Vec<String> = first_line
            .unwrap()
            .unwrap()
            .split_whitespace()
            .map(str::to_string)
            .collect();
        let mut edges: Vec<Vec<usize>> = vec![vec![]; names.len()];
        for line in lines {
            let line = line?;
            let mut it = line.splitn(2, ": ");
            let (oi, orst) = (it.next(), it.next());
            if oi.is_none() || orst.is_none() {
                return Err(GraphError::BadFormat);
            }
            let (i, rst) = (oi.unwrap(), orst.unwrap());
            let i: usize = i.parse()?;
            for jstr in rst.split_whitespace() {
                let j: usize = jstr.parse().unwrap();
                edges[i - 1].push(j - 1);
            }
        }
        Ok(Graph { names, edges })
    }
}
