# list-routines

This is an interactive dataset for program learning. The routines in this
dataset take as input a number or a list of numbers, and the output is
either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

## Installation

1. Install [`racket`](http://racket-lang.org). It should be usable from the
   shell as `racket` and via `raco`.
2. Execute `raco exe -o list-routines src/main.rkt` to compile the binary.

## Usage

TODO

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
