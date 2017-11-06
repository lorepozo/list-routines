# list-routines

This is a dataset for program learning. The routines in this dataset take in
one of a number, list of numbers, or list of lists of numbers, and the
output is either a Boolean, number, or list of numbers.

```
INPUT:   Num | List<Num> | List<List<Num>>
OUTPUT:  Bool | Num | List<Num>
ROUTINE: INPUT => OUTPUT
```

This dataset is in the form of a web server.

## API

All successful responses are of the form `{"result": <result>}`. All
unsuccessful responses are of the form `{"error": "explanation"}`.

- **FIND** (GET) `/find` returns a list of `id`s of routines in the dataset.
  It currently takes (optionally) one query argument, `count`: e.g.
  `/find?count=2`. Eventually support will be added for more constraints on
  finding.

  ```bash
  $ api="http://list-routines.xvm.mit.edu/api"
  $ curl "$api/find?count=3"
  {"result": ["len", "odds", "evens"]}
  ```
- **EXAMPLES** (GET) `/examples/<id>` returns a list of `INPUT`s for the
  given routine. These inputs should be representative of the routine's
  function.

  ```bash
  $ api="http://list-routines.xvm.mit.edu/api"
  $ curl "$api/examples/len"
  {"result": [[1,2,3],[0],[1,1,2,1]]}
  ```
- **GENERATE** (GET) `/gen/<id>` returns a list of `INPUT`s for the routine
  that have been randomly generated. It takes optional parameters as query
  arguments, such as `count`: e.g. `/gen/len?count=3`. Most routines also
  have the `len` argument to constrain the length of generated inputs.

  ```bash
  $ api="http://list-routines.xvm.mit.edu/api"
  $ curl "$api/gen/index-head?count=3&len=3"
  {"result":[[2,13,9],[1,7,7],[1,4,14]]}
  ```
- **EVALUATE** (POST) `/eval/<id>` takes in json data representing input for
  the routine, and returns an `OUTPUT`. Invalid input for the routine
  results in a bad request error (HTTP 400).

  ```bash
  $ api="http://list-routines.xvm.mit.edu/api"
  $ curl -XPOST "$api/eval/len" --data "[5, 1, 2, 0]"
  {"result":4}
  ```

