# list-routines

This is a dataset for program learning. The routines in this dataset take in
one of a number, list of numbers, or list of lists of numbers, and the
output is either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num> | List<List<Num>>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a web server. It is currently **highly
experimental** and subject to significant frequent change.

## API

All successful responses are of the form `{"result": <result>}`. All
unsuccessful responses are of the form `{"error": "explanation"}`.

The following usage examples, using the `curl` command-line tool, assume
you've set a shell variable with the api url:

```bash
$ api="http://localhost:8000"
```

- **FIND** (GET) `/find` returns a list of `id`s of routines in the dataset.
  It currently takes (optionally) one query argument, `count`: e.g.
  `/find?count=2`. Eventually support will be added for more constraints on
  finding.

  ```bash
  $ curl "$api/find?count=3"
  {"result": ["len", "odds", "evens"]}
  ```
- **EXAMPLES** (GET) `/examples/<id>` returns a list of `INPUT`s for the
  given routine. These inputs should be representative of the routine's
  function.

  ```bash
  $ curl "$api/examples/len"
  {"result": [[1,2,3],[0],[1,1,2,1]]}
  ```
- **GENERATE** (GET) `/gen/<id>` returns a list of `INPUT`s for the routine
  that have been randomly generated. It takes optional parameters as query
  arguments, such as `count`: e.g. `/gen/len?count=3`. Most routines also
  have the `len` argument to constrain the length of generated inputs.

  ```bash
  $ curl "$api/gen/index-head?count=3&len=3"
  {"result":[[2,13,9],[1,7,7],[1,4,14]]}
  ```
- **EVALUATE** (POST) `/eval/<id>` takes in json data representing input for
  the routine, and returns an `OUTPUT`. Invalid input for the routine
  results in a bad request error (HTTP 400).

  ```bash
  $ curl -XPOST "$api/eval/len" --data "[5, 1, 2, 0]"
  {"result":4}
  ```

## Python driver

To use the python driver for this API, copy
[listroutines.py](https://github.com/lucasem/list-routines/blob/master/listroutines.py)
to the directory where you are writing your python script.

You must be using python 3 and have installed the requests library (`pip
install requests`).

```python
import listroutines as lr

# FIND returns objects of class lr.Routine.
routines = lr.find(count=3)
[routine.id() for routine in routines]
# -> ["len", "index-head", "odds"]

# open a routine using its id.
evens = lr.Routine("evens")

# EXAMPLES returns list of inputs.
evens.examples()
# -> [[2, 0, 4], [2, 5, 4, 2, 0, 5, 1, 1]]

# EVAL evalutes the routine on given input.
evens.eval([2, 5, 4, 2, 0, 5, 1, 1])
# -> [2, 4, 2, 0]

# GEN returns a list of newly-generates valid routine inputs.
# Defaults to returning one input.
evens.gen()
# -> [[4, 6]]

# GEN takes parameters.
# All routines accept the "count" parameter, and most routines accept the "len"
# parameter. See routine description to determine what parameters can be used.
evens.gen(count=3)
# -> [[7, 7, 12, 7], [14, 5, 16, 8, 11, 12, 3], [15, 9, 2]]
evens.gen(count=3, len=2)
# -> [[11, 12], [16, 12], [10, 10]]
```

Advanced users can set the `listroutines.api` variable to the url of the API
server (defaults to `http://localhost:8000`).
