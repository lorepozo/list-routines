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

Install [`racket`](http://racket-lang.org). It should be usable from the
shell as `racket` and via `raco`.

There are two ways of using this dataset:
- The **REPL**, for interactive use of the dataset, can be compiled with `raco exe -o list-routines-static src/main_repl.rkt`.
- The **static exporter**, for static/fixed use of the dataset, can be compiled with `raco exe -o list-routines-repl src/main_static.rkt`.

## Usage

### Static Exporter

If all you want is a big JSON dump of some input-output examples that
correspond to true and somewhat-intuitive routines, use the **static
exporter**. Once you've [built the binary](#installation), try executing it
with `--help` to see the options. To get more complex routines, you must
request enough routines to warrant generation of more complex ones
("complex" meaning composition).

Here's example usage:

```sh
$ ./list-routines-static --routines 2 --examples 5
```

```json
[
  {
    "name":"((drop-k (dyn . 0) (static .  5)))",
    "type": {"input": "list-of-int", "output": "list-of-int"},
    "examples": [
      {"i":[13,6,9,13,10], "o":[]},
      {"i":[15,2,11,8,1,10], "o":[10]},
      {"i":[8,4,15,13,7,12,10], "o":[12,10]},
      {"i":[5,6,6,16,2,11,2,7,0,10,0,5], "o":[11,2,7,0,10,0,5]},
      {"i":[3,13,6,4,4,4,10,11,0,2,1], "o":[4,10,11,0,2,1]}
    ]
  },
  {
    "name":"((take-k (dyn . 0) (static . 3)))",
    "type": {"input": "list-of-int", "output": "list-of-int"},
    "examples": [
      {"i":[16,13,4,5,8,3,1,6,10], "o":[16,13,4]},
      {"i":[4,12,10,11,16,5,1], "o":[4,12,10]},
      {"i":[14,0,16,8,8,9,13,10,14,16], "o":[14,0,16]},
      {"i":[2,7,4,4,14,8,6,8,12,0], "o":[2,7,4]},
      {"i":[3,9,1,10,16,5,12,4], "o":[3,9,1]}
    ]
  }
]
```

### REPL

If you want to leverage all the capabilities of this interactive dataset,
use the **REPL**. The REPL is JSON-based and line-delimited. Every
instruction is of the form `{"op": <op>, ...REST }`, where the `...REST` is
filled in depending on the operator. The following operators are defined:
- `evaluate`: `{"routine": <ROUTINE>, "input": <INPUT>}`

  Returns the output of the given routine on the input, or `null` if
  evaluation failed.
- `generate-examples`: `{"routine": <ROUTINE>, "count": <number>}` with
  optional parameter `gen-params` whose value should be an object. The
  valid key/value pairs in `gen-params` depends on the first subroutine
  present in the routine — usually you can set `len` to some number to
  restrict generated inputs to only have the given length. `gen-params`
  defaults to `{}`.

  Returns a list of input/output pairs in the form `{"i": <INPUT>, "o":
  <OUTPUT>}`.
- `resample-params`: `{"routine": <ROUTINE>}` with optional parameter
  `rand-limit` set to a number which describes how large random static
  parameter values may be. `rand-limit` defaults to `8`.

  Returns a `<ROUTINE>` that has different static parameters than the
  supplied routine.
- `generate-routines`: `{"count": <number>}` with optional parameters
  `rand-limit` (same role as above) and `no-shuffle`. Setting `no-shuffle`
  to `true` results in output being deterministic in routine structure, but
  not necessarily deterministic in static values. `rand-limit` defaults to
  `8` and `no-shuffle` defaults to `false`.

  Returns a list of `<ROUTINE>`.

## Routine "names"

A routine name represents a directed acyclic graph that describes
computation. For example, consider the following routine: TODO
