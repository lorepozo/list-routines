#![feature(plugin, option_filter, slice_patterns)]
#![plugin(phf_macros)]

extern crate phf;
extern crate rand;

use rand::Rng;
use rand::distributions::{Distribution, range::{Range, RangeInt}};
use std::cmp::Ordering;

struct RandomList {
    len: usize,
    r: Range<RangeInt<i32>>,
}
impl RandomList {
    fn of_len(len: usize) -> Self {
        let r = Range::new(0, 17);
        RandomList { len, r }
    }
}
impl Distribution<Vec<i32>> for RandomList {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> Vec<i32> {
        (0..self.len).map(|_| self.r.sample(rng)).collect()
    }
}

/// `count` MUST be no greater than `len`.
fn random_list_exact_occurrence<R, C, G>(
    rng: &mut R,
    cond: C,
    gen: G,
    len: usize,
    count: Option<usize>,
    r: Option<Range<RangeInt<i32>>>,
) -> Vec<i32>
where
    R: Rng,
    C: Fn(i32) -> bool,
    G: Fn() -> i32,
{
    let r = r.unwrap_or_else(|| Range::new(0, 17));
    let count = count.unwrap_or_else(|| {
        if len == 0 {
            0
        } else {
            // at least one
            1 + Range::sample_single(0, len, rng)
        }
    });
    let mut l = RandomList { len, r }.sample(rng);
    let current_count = l.iter().filter(|&&c| cond(c)).count();
    match current_count.cmp(&count) {
        Ordering::Equal => (),
        Ordering::Less => {
            let mut d = count - current_count;
            while d > 0 {
                let n = Range::sample_single(0, len - current_count, rng);
                let i = l.iter()
                    .enumerate()
                    .filter(|&(_, x)| !cond(*x))
                    .map(|(i, _)| i)
                    .nth(n)
                    .unwrap();
                let mut x = gen();
                while !cond(x) {
                    x = gen()
                }
                l[i] = x;
                d -= 1;
            }
        }
        Ordering::Greater => {
            let mut d = current_count - count;
            while d > 0 {
                let n = Range::sample_single(0, current_count, rng);
                let i = l.iter()
                    .enumerate()
                    .filter(|&(_, x)| cond(*x))
                    .map(|(i, _)| i)
                    .nth(n)
                    .unwrap();
                let mut x = gen();
                while cond(x) {
                    x = gen()
                }
                l[i] = x;
                d -= 1;
            }
        }
    }
    l
}

static NAMES: phf::Map<&'static str, Routine> = phf_map! {
    "add-k"    => Routine::Add,
    "append-k" => Routine::Append,
    "count-k"  => Routine::Count,
    "len"      => Routine::Len,
};

use Space::*;
#[derive(Clone, Debug, PartialEq)]
pub enum Space {
    Bool(bool),
    Num(i32),
    List(Vec<i32>),
}

#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Routine {
    Add,
    Append,
    Count,
    Len,
}
impl Routine {
    pub fn name(&self) -> &'static str {
        match *self {
            Routine::Add => "add-k",
            Routine::Append => "append-k",
            Routine::Count => "count-k",
            Routine::Len => "len",
        }
    }
    pub fn from_name(name: &'static str) -> Option<Self> {
        NAMES.get(name).cloned()
    }
    pub fn description(&self) -> &'static str {
        match *self {
            Routine::Add => "adds `k` to each element.",
            Routine::Append => "appends the number `k`.",
            Routine::Count => "counts occurrences of the number `k`.",
            Routine::Len => "gets the length of the list.",
        }
    }
    pub fn deps(&self) -> &'static [Routine] {
        static NO_DEPS: &[Routine] = &[];
        match *self {
            Routine::Add | Routine::Append | Routine::Count | Routine::Len => NO_DEPS,
        }
    }
    pub fn n_args(&self) -> usize {
        match *self {
            Routine::Add | Routine::Append | Routine::Count => 1,
            Routine::Len => 0,
        }
    }
    /// args must have length corresponding to `arity`.
    pub fn evaluate(&self, input: Space, args: &[i32]) -> Option<Space> {
        match *self {
            Routine::Add => match (input, args[0]) {
                (List(l), k) => Some(List(l.into_iter().map(|x| x + k).collect())),
                _ => None,
            },
            Routine::Append => match (input, args[0]) {
                (List(mut l), k) => {
                    l.push(k);
                    Some(List(l))
                }
                _ => None,
            },
            Routine::Count => match (input, args[0]) {
                (List(l), k) => Some(Num(l.into_iter().filter(|&x| x == k).count() as i32)),
                _ => None,
            },
            Routine::Len => match input {
                List(l) => Some(Num(l.len() as i32)),
                _ => None,
            },
        }
    }
    /// `rest` must have length `self.arity()-1`.
    pub fn generate<R: Rng>(&self, rng: &mut R, len: Option<usize>, args: &[i32]) -> Space {
        match *self {
            Routine::Add | Routine::Append | Routine::Len => {
                let len = len.unwrap_or_else(|| Range::sample_single(0, 8, rng));
                List(RandomList::of_len(len).sample(rng))
            }
            Routine::Count => {
                let len = len.unwrap_or_else(|| Range::sample_single(0, 8, rng));
                if rng.gen() {
                    let k = args[0];
                    List(random_list_exact_occurrence(
                        rng,
                        |x| x == k,
                        || k,
                        len,
                        None,
                        None,
                    ))
                } else {
                    List(RandomList::of_len(len).sample(rng))
                }
            }
        }
    }
    /// returns slice of `args` each with length `self.arity()-1`.
    pub fn example_args(&self) -> &'static [&'static [i32]] {
        static _EMPTY_EXAMPLE_ARGS: &[&[i32]] = &[&[]];
        static ADD_EXAMPLE_ARGS: &[&[i32]] = &[&[1], &[2], &[3], &[-2], &[10]];
        static APPEND_EXAMPLE_ARGS: &[&[i32]] = &[&[2], &[3], &[-2], &[10]];
        static COUNT_EXAMPLE_ARGS: &[&[i32]] = &[&[2], &[3], &[10]];
        match *self {
            Routine::Add => ADD_EXAMPLE_ARGS,
            Routine::Append => APPEND_EXAMPLE_ARGS,
            Routine::Count => COUNT_EXAMPLE_ARGS,
            Routine::Len => _EMPTY_EXAMPLE_ARGS,
        }
    }
}

#[cfg(test)]
mod tests {
    use rand::thread_rng;
    use super::{Routine::*, Space::*, NAMES};

    #[test]
    fn names() {
        for (k, v) in NAMES.entries() {
            assert_eq!(*k, v.name())
        }
    }
    #[test]
    fn gen() {
        let rng = &mut thread_rng();
        for routine in NAMES.values() {
            for args in routine.example_params() {
                for _ in 0..3 {
                    let inp = routine.generate(rng, None, args);
                    assert!(routine.evaluate(inp, args).is_some());
                }
            }
        }
    }
}
