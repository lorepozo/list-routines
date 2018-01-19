# Hosting

* TOC
{:toc}

## Setup

1. Install [racket](https://racket-lang.org). It should be usable from the
   shell as `racket` and via `raco`.
2. Clone the repository
   [lucasem/list-routines](https://github.com/lucasem/list-routines) and
   change into its directory:
   ```sh
   $ git clone https://github.com/lucasem/list-routines
   $ cd list-routines
   ```
3. _[web server]_: Install rust via [rustup.rs](https://rustup.rs).
4. _[web server]_: Set the project's rust toolchain to
   `nightly`:
   ```sh
   $ rustup override set nightly
   ```

## Web Server

```sh
$ cargo run --release
```

Detailed usage for the web server can be found at the [root of this
website](/).


## Local Program with Standard I/O

```sh
$ raco exe src/racket/loader.rkt
$ ./src/racket/loader
```

The usage is based on line-delimited JSON input/output. The docstring at the
top of
[loader.rkt](https://github.com/lucasem/list-routines/blob/master/src/racket/loader.rkt)
describes the format of the input and output JSON.


## Export Static Examples

```sh
# saves exported routines to output.json:
$ racket etc/generate_static.rkt -o output.json
```

You may set the number of generated examples
using `--train` and `--test` (see `--help` for details).

The output of the racket script isn't so pretty. To make it pretty (like
the example below), use the provided vim script:
```sh
$ vim -s etc/clean_static.vim output.json
# if using neovim, pass --headless to make things faster
$ nvim --headless -s etc/clean_static.vim output.json
```

The output JSON is a list of exported routines of the following form:
```json
[
  { "name": "caesar-cipher-k-modulo-n with k=13 and n=26",
    "is_parametric": true,
    "description": "performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.",
    "dependencies": [ "modulo-k", "add-k" ],
    "test": [
      { "i": [ 15, 4, 15 ], "o": [ 2, 17, 2 ] },
      { "i": [ 10, 13 ], "o": [ 23, 0 ] },
      { "i": [ 3, 10, 7, 16, 10, 8, 5 ], "o": [ 16, 23, 20, 3, 23, 21, 18 ] },
      { "i": [], "o": [] },
      { "i": [ 1, 12, 6, 14, 1 ], "o": [ 14, 25, 19, 1, 14 ] }
    ],
    "train": [
      { "i": [ 5, 7, 4, 10, 9, 0, 5 ], "o": [ 18, 20, 17, 23, 22, 13, 18 ] },
      { "i": [ 6 ], "o": [ 19 ] },
      { "i": [ 6, 11, 12, 16, 1, 9, 6 ], "o": [ 19, 24, 25, 3, 14, 22, 19 ] },
      { "i": [ 11, 5 ], "o": [ 24, 18 ] },
      { "i": [ 8, 5 ], "o": [ 21, 18 ] }
    ]
  }
```
