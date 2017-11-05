use std::{error, fmt};
use std::io::{self, BufRead, Write};
use std::num::ParseIntError;

use itertools::Itertools;

#[derive(Debug)]
pub enum Error {
    BadFormat,
    IO(io::Error),
}
impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            Error::BadFormat => write!(f, "graph error: bad format"),
            Error::IO(ref err) => write!(f, "IO error: {}", err),
        }
    }
}
impl error::Error for Error {
    fn description(&self) -> &str {
        match *self {
            Error::BadFormat => "graph error: bad format",
            Error::IO(ref err) => err.description(),
        }
    }
}
impl From<io::Error> for Error {
    fn from(err: io::Error) -> Error {
        Error::IO(err)
    }
}
impl From<ParseIntError> for Error {
    fn from(_: ParseIntError) -> Error {
        Error::BadFormat
    }
}

#[derive(Debug)]
pub struct DiGraph {
    pub names: Vec<String>,
    pub edges: Vec<Vec<usize>>,
}
impl DiGraph {
    #[allow(dead_code)]
    pub fn to_writer<T: Write>(&self, w: &mut T) -> Result<(), Error> {
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

    pub fn load<T: BufRead>(r: T) -> Result<Self, Error> {
        let mut lines = r.lines();
        let first_line = lines.next();
        let names: Vec<String> = first_line
            .ok_or(Error::BadFormat)??
            .split_whitespace()
            .map(str::to_string)
            .collect();
        let mut edges: Vec<Vec<usize>> = vec![vec![]; names.len()];
        for line in lines {
            let line = line?;
            let mut it = line.splitn(2, ": ");
            let i: usize = it.next().ok_or(Error::BadFormat)?.parse()?;
            let rst = it.next().ok_or(Error::BadFormat)?;
            for jstr in rst.split_whitespace() {
                let j: usize = jstr.parse()?;
                edges[i - 1].push(j - 1);
            }
        }
        Ok(DiGraph { names, edges })
    }
}

#[cfg(test)]
mod tests {
    use super::DiGraph;

    fn load_and_store(s: &str) {
        let g = DiGraph::load(s.as_bytes()).expect("load valid graph");
        let mut out: Vec<u8> = Vec::new();
        g.to_writer(&mut out).expect("serialize graph");
        let out_str = String::from_utf8(out).expect("serialized graph is utf-8");
        assert_eq!(s, &out_str);
    }

    #[test]
    fn one_node_no_edges() {
        load_and_store("a\n");
    }

    #[test]
    fn many_node_no_edges() {
        load_and_store("a b c\n");
    }

    #[test]
    fn edges() {
        load_and_store("a b\n1: 2\n2: 1\n");
        load_and_store("a b c\n1: 2\n2: 3\n3: 1\n");
        load_and_store("a b c d\n1: 4\n");
        load_and_store("a b c d\n1: 2 3 4\n2: 3 4\n3: 4\n");
    }
}
