# list-routines

This is a dataset for program learning. The routines in this dataset take in
one of a number, list of numbers, or list of lists of numbers, and the
output is either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num> | List<List<Num>>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a web server. For information on using it,
see the [Project Homepage](https://lucasem.github.io/list-routines/).

## Installation

1. Install [`racket`](http://racket-lang.org). It should be usable from the
   shell as `racket`.
2. Install rust via [rustup.rs](https://rustup.rs).
3. Set the toolchain to `nightly`:
   ```sh
   $ rustup default nightly
   ```

## Run

Use `cargo run` to run the server. Add the `--release` flag for better
performance (and slower compilation). **This must be executed from the
project root directory** (for now).

## Adding routines

Routines are currently not relational, so adding a new routine is easy.
Simply add the source file `./src/routines/sum.rkt`
which provides:
- `description`, string
- `deps`, list of strings
- `validate`, INPUT => bool
- `evaluate`, INPUT => OUTPUT
- `examples`, list of INPUTs
- `generate`, params => list of INPUTs
See existing routine implementations for an example.

After routines are added, create the `routines.graph` file:

```sh
$ cd etc
$ racket graph_generate.rkt
output written to ../routines.graph
```

## Testing

Run `cargo test routines -- --nocapture` to test all of the routines.
