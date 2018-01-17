# Hosting

* TOC
{:toc}

## Web Server

1. _[setup]_: Install [`racket`](https://racket-lang.org). It should be
   usable from the shell as `racket`.
2. _[setup]_: Install rust via [rustup.rs](https://rustup.rs).
3. _[setup]_: Set the toolchain to `nightly-2017-12-20`:
   ```sh
   $ rustup default nightly-2017-12-20
   ```
4. _[setup]_: Clone the repository
   [lucasem/list-routines](https://github.com/lucasem/list-routines)
5. _[run]_: From the root directory of the source code repository, execute
   `cargo run --release`

Detailed usage for the web server can be found at the [root of this
website](/).


## Local Program with Standard I/O

1. _[setup]_: Install [`racket`](https://racket-lang.org). It should be
   usable from the shell as `racket`.
2. _[setup]_: Clone the repository
   [lucasem/list-routines](https://github.com/lucasem/list-routines)
3. _[run]_: Execute `racket src/loader.rkt`

The usage is based on line-delimited JSON input/output. The docstring at the
top of
[loader.rkt](https://github.com/lucasem/list-routines/blob/master/src/loader.rkt)
describes the format of the input and output JSON.


## Export Static Examples

1. _[setup]_: Install [`racket`](https://racket-lang.org). It should be
   usable from the shell as `racket`.
2. _[setup]_: Clone the repository
   [lucasem/list-routines](https://github.com/lucasem/list-routines)
3. _[run]_: Execute `racket -o output.json etc/generate_static.rkt` to save
   exported routines to `output.json`.

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

The output of the racket script isn't so pretty. To make it pretty (like
shown above), use the provided vim script:
```sh
vim -s etc/clean_static.vim output.json
# if using neovim, pass --headless to make things faster
nvim --headless -s etc/clean_static.vim output.json
```
