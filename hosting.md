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

TODO
