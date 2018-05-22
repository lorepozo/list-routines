# list-routines

This is an interactive dataset for program learning. The routines in this
dataset take as input a number or a list of numbers, and the output is
either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a [**REPL**](#repl) and a [**static
exporter**](#static-exporter). It is currently highly experimental and
subject to significant change.

## Installation

Install [`racket`](http://racket-lang.org). It should be usable from the
shell as `racket` and via `raco`.

There are two ways of using this dataset:
- The **REPL**, for interactive use of the dataset, can be compiled with `raco exe -o list-routines-static src/main_repl.rkt`.
- The **static exporter**, for static/fixed use of the dataset, can be compiled with `raco exe -o list-routines-repl src/main_static.rkt`.

## Usage

See the documentation at https://lucasem.github.io/list-routines/
