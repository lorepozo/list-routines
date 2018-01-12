# list-routines

**Table of Contents**:
* TOC
{:toc}

This is an interactive dataset for program learning. The routines in this
dataset take in one of a number, list of numbers, or list of lists of
numbers, and the output is either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num> | List<List<Num>>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a web server. It is currently **highly
experimental** and subject to significant frequent change.

**Why a web server?** This dataset can randomly generate new valid inputs
and outputs for a routine, as well as provide polymorphic routines with
given parameters. If this dataset were stored statically like most datasets,
this wouldn't be possible. For other means of interacting with this dataset,
such as with a local program using standard I/O or by exporting static
examples, see the page on [hosting](hosting).

# Tasks

Here are a few machine learning tasks that this dataset aims to provide:
- Learning via blackbox evaluation.
- Learning via input-output pairs.
- Active learning.
- Generating adversarial/informative new inputs.
- Generating valid inputs.
- Identifying valid inputs.
- Determining restrictions on routine output.
- Determining whether a routine is conceptually dependent on another routine.

# Web API

All successful responses are of the form `{"result": <result>}`. All
unsuccessful responses are of the form `{"error": "explanation"}`.

The following usage examples, using the `curl` command-line tool, assume
you've set a shell variable with the api url:

```bash
$ api="http://localhost:8000"
```

- **FIND** (GET) `/find` returns a list of `id`s of routines in the dataset.
  It currently takes (optionally) three query arguments: `count`,
  `depends_on`, `depended_on_by`. Eventually support will be added for more
  constraints on finding.

  `count` takes a nonnegative integer, `depends_on` and `depended_on_by`
  take a routine id.

  ```bash
  $ curl "$api/find?count=3"
  {"result": ["len", "odds", "evens"]}

  $ curl "$api/find?count=3&depended_on_by=count-head-in-tail"
  {"result": ["head", "tail", "count2"]}

  $ curl "$api/find?count=3&depends_on=head"
  {"result": ["count-head-in-tail", "head-in-tail", "index-head"]}
  ```
- **DESCRIPTION** (GET) `/description/<id>` returns text of the
  documentation for the given routine.

  ```bash
  $ curl "$api/description/len"
  {"result": "gets the length of the list."}
  ```
- **IS-PARAMETRIC** (GET) `/is-parametric/<id>` returns a boolean of whether
  the given routine is parametric.

  ```bash
  $ curl "$api/is-parametric/add-k"
  {"result": true}
  ```
- **EXAMPLES** _nonparametric only_ (GET) `/examples/<id>` returns a list of
  `INPUT`s for the given routine. These inputs should be representative of
  the routine's function.

  ```bash
  $ curl "$api/examples/len"
  {"result": [[1,2,3],[0],[1,1,2,1]]}
  ```
- **EXAMPLE-PARAMS** _parametric only_ (GET) `/examples/<id>` returns a list
  of key-value mappings of parameters and their assignments for the given
  parametric routine. These parameters should provide representative
  functions for the routine's concept.

  ```bash
  $ curl "$api/example-params/add-k"
  {"result": [{"k":2}, {"k":3}, {"k":10}]}
  ```
- **GENERATE** (GET) `/gen/<id>` returns a list of `INPUT`s for the routine
  that have been randomly generated. It takes optional parameters as query
  arguments, such as `count`: e.g. `/gen/len?count=3`. Most routines also
  have the `len` argument to constrain the length of generated inputs.

  ```bash
  $ curl "$api/gen/index-head?count=3&len=3"
  {"result":[[2,13,9],[1,7,7],[1,4,14]]}
  ```
- **EVALUATE** (POST) `/eval/<id>` takes in JSON data representing input for
  the routine, and returns an `OUTPUT`. For parametric routines, parameters
  are given as query arguments. Invalid input or parameters for the routine
  results in a bad request error (HTTP 400).

  ```bash
  $ curl -XPOST "$api/eval/len" --data "[5, 1, 2, 0]"
  {"result":4}

  $ curl -XPOST "$api/eval/add-k?k=4" --data "[5, 1, 2, 0]"
  {"result":[9, 5, 6, 4]}
  ```

# Python API

To use the python driver for this API you must be using python &#8805; 3.6.
Clone the repository and execute the following:

```sh
$ pip install -e listroutines/py
```

The module at
[listroutines.py](https://github.com/lucasem/list-routines/blob/master/py/listroutines.py)
is self-documented.


```python
import listroutines as lr

# FIND new routines
routines = lr.find(count=3)
[routine.id for routine in routines]
# -> ['len', 'index-head', 'odds']

# open a routine using its id.
evens = lr.Routine("evens")

# EXAMPLES returns list of inputs.
evens.examples()
# -> [[2, 0, 4], [2, 5, 4, 2, 0, 5, 1, 1]]

# EVAL evaluates the routine on given input.
evens.eval([2, 5, 4, 2, 0, 5, 1, 1])
# -> [2, 4, 2, 0]

# GEN returns a list of newly-generates valid routine inputs.
# Defaults to returning one input.
evens.gen()
# -> [[4, 6]]

# GEN takes parameters.
# All routines accept the "count" parameter, and most routines accept the "len"
# parameter. See routine documentation to determine what parameters can be used.
evens.gen(count=3)
# -> [[7, 7, 12, 7], [14, 5, 16, 8, 11, 12, 3], [15, 9, 2]]
evens.gen(count=3, len=2)
# -> [[11, 12], [16, 12], [10, 10]]

# Conceptual dependence with .dependencies()
count_head_in_tail = lr.Routine("count-head-in-tail")
[routine.id for routine in count_head_in_tail.dependencies()]
# -> ['head', 'tail', 'count2']

# Conceptual reverse-dependence with .depends()
[routine.id for routine in evens.depends()]
# -> ['keep-mod-head', 'remove-mod-head']
```

Advanced users can set the `listroutines.api` variable to the api url
(defaults to `http://localhost:8000`).

# [Routine documentation](routines)

# Adding new routines

To petition for adding a new routine, open a pull request on GitHub with the
new routine source file. When designing a new routine, consider that:
- routines should be reasonable for a human to learn.
- routines should have a succinct id.
- routines that are complex should specify conceptual dependencies. If
  there are prerequisite concepts that aren't yet in the dataset, add those
  routines as well.

Contact me at [lucas@lucasem.com](mailto:lucas@lucasem.com) if you have
further questions.

# Not yet implemented

The following features will be implemented soon:
- Parameterized routines: routines that are specified by parameters.
  For example, `add-k` could require a parameter such as `k=2` which would
  add the number `k` to each element in a list. There are ways to make this
  easy to use and reason about, programmatically.
- Properties of routines: simple tags to associate with routines.
- Complex find queries: use the partial ordering and properties to constrain
  search for routines. For example: _which routines depend on `head`?_; or
  _what routines does `count-head-in-tail` depend on?_; or _what routines
  depend on `head` and return a boolean_?
