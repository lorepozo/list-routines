//! # Graph
//!
//! See the directed graph implementation, [`DiGraph`], for details.
//!
//! [`DiGraph`]: struct.DiGraph.html

use std::{error, fmt};
use std::io::{self, BufRead, Write};
use std::num::ParseIntError;

use itertools::Itertools;

/// The error type for graph operations.
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

/// A directed graph with named vertices. The [`edges`] and [`names`] fields
/// have the same length, and are indexed by vertex numbering. The values of
/// [`edges`] are lists of adjacent indexes.
///
/// The serialized representation is created via the [`to_writer`] method and
/// loaded via the [`load`] method. In this representation, the first line is a
/// space-separated list of ordered vertex names. Each subsequent line is of the
/// form `i: <j...>` where `i` is a vertex number (1-indexed according to the
/// names from the first line) and `<j...>` is a space-separated list of vertex
/// numbers that the vertex `i` has a directed edge to.
///
/// For example, consider a "love triangle" graph with three vertices _A_, _B_,
/// and _C_, where _A_ points to _B_, _B_ points to _C_, and _C_ points to _A_.
/// The serialized representation is:
///
/// ```text
/// A B C
/// 1: 2
/// 2: 3
/// 3: 1
/// ```
///
/// The resulting DiGraph from [`load`] one the above serialization is as
/// follows (note that the vertex numbers are zero-indexed here, unlike in the
/// serial representation):
///
/// ```rust,ignore
/// DiGraph {
///     names: vec!["A", "B", "C"],
///     edges: vec![vec![1], vec![2], vec![0]],
/// }
/// ```
///
/// ## Examples
///
/// Given a vertex name, you can get the names of adjacent vertices:
///
/// ```
/// use listroutines::graph::DiGraph;
/// use std::io::BufReader;
///
/// let s = "A B C
/// 1: 2 3
/// 2: 3
/// ";
/// let f = BufReader::new(s.as_bytes());
/// let graph = DiGraph::load(f).unwrap();
///
/// let name = "A";
/// let i = graph.find(name).unwrap();
/// let adj: Vec<&str> = graph.edges[i].iter().map(|&j| &*graph.names[j]).collect();
/// assert_eq!(adj, vec!["B", "C"]);
/// ```
///
/// [`names`]: #structfield.names
/// [`edges`]: #structfield.edges
/// [`load`]: #method.load
/// [`to_writer`]: #method.to_writer
#[derive(Debug)]
pub struct DiGraph {
    /// Vertex names. Indexed by vertex numbering.
    pub names: Vec<String>,
    /// Adjacency list. Indexed by vertex numbering. Values are lists of vertex
    /// numbers for adjacent vertices.
    pub edges: Vec<Vec<usize>>,
    /// Reverse adjacency list. Indexed by vertex numbering. Values are lists
    /// of vertex numbers for pre-adjacent vertices.
    pub rev_edges: Vec<Vec<usize>>,
}
impl DiGraph {
    /// Returns the vertex numbering for the given vertex name.
    pub fn find(&self, name: &str) -> Option<usize> {
        self.names.iter().position(|s| s == name)
    }

    /// Serializes the graph into the given writer.
    ///
    /// See [`DiGraph`] for information on the serialized format.
    ///
    /// [`DiGraph`]: #
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

    /// Deserializes the buffer into a [`DiGraph`].
    ///
    /// See [`DiGraph`] for information on the serialized format.
    ///
    /// [`DiGraph`]: #
    pub fn load<T: BufRead>(r: T) -> Result<Self, Error> {
        let mut lines = r.lines();
        let first_line = lines.next();
        let names: Vec<String> = first_line
            .ok_or(Error::BadFormat)??
            .split_whitespace()
            .map(str::to_string)
            .collect();
        let mut edges: Vec<Vec<usize>> = vec![vec![]; names.len()];
        let mut rev_edges: Vec<Vec<usize>> = vec![vec![]; names.len()];
        for line in lines {
            let line = line?;
            let mut it = line.splitn(2, ": ");
            let i: usize = it.next().ok_or(Error::BadFormat)?.parse()?;
            let rst = it.next().ok_or(Error::BadFormat)?;
            for jstr in rst.split_whitespace() {
                let j: usize = jstr.parse()?;
                edges[i - 1].push(j - 1);
                rev_edges[j - 1].push(i - 1);
            }
        }
        Ok(DiGraph {
            names,
            edges,
            rev_edges,
        })
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
