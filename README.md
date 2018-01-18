# list-routines

This is an interactive dataset for program learning. The routines in this
dataset take as input a number or a list of numbers, and the output is
either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a web server. For information on using it,
see the [Project Homepage](https://lucasem.github.io/list-routines/).

## Installation

1. Install [`racket`](http://racket-lang.org). It should be usable from the
   shell as `racket`.
2. Install rust via [rustup.rs](https://rustup.rs).
3. In the project directory, set the project's toolchain to `nightly`:
   ```sh
   $ rustup override set nightly
   ```

## Run

Use `cargo run` to run the server. Add the `--release` flag for better
performance (and slower compilation). **This must be executed from the
project root directory**.

## Adding routines

To add a routine, you must first consider whether it should be
parametric. See existing routine implementations for examples.

**parametric** routines must provide the following:
- `is-parametric`, bool
- `description`, string
- `deps`, list of strings
- `validate-params`, params => bool
- `validate`, INPUT params => bool
- `evaluate`, INPUT params => OUTPUT
- `example-params`, list of params
- `generate`, params => list of INPUTs

**non**-parametric routines must provide the following:
- `is-parametric`, bool
- `description`, string
- `deps`, list of strings
- `validate`, INPUT => bool
- `evaluate`, INPUT => OUTPUT
- `examples`, list of INPUTs
- `generate`, params => list of INPUTs

After routines are added, create the `routines.graph` file:

```sh
$ racket etc/generate_graph.rkt
output written to routines.graph
```

## Testing

Run `cargo test -- --nocapture` to test everything.
