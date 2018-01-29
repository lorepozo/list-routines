# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [6,3,0,2] => [7,4,1,3]
  - [13,2,12,8,16] => [14,3,13,9,17]
  - [8,7,10,5,12,5] => [9,8,11,6,13,6]
- k=2
  - [6,12,2,3,8] => [8,14,4,5,10]
  - [12,10] => [14,12]
  - [6,10,4] => [8,12,6]
- k=3
  - [1,2,10,9,8,9,16] => [4,5,13,12,11,12,19]
  - [15,7,13] => [18,10,16]
  - [2,8,9,14,4] => [5,11,12,17,7]
- k=-2
  - [16,6] => [14,4]
  - [0,13,15] => [-2,11,13]
  - [] => []
- k=10
  - [] => []
  - [9,8,10,7,16,11] => [19,18,20,17,26,21]
  - [2,2,4] => [12,12,14]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [16,4,4,3] => [16,4,4,3,4]
  - [0,8,8,11,15,2,8,15] => [0,8,8,11,15,2,8,15,8]
  - [0,0,10,14] => [0,0,10,14,0]
- k=3
  - [2,5,13,7] => [2,5,13,7,13]
  - [3,8,2,11,11,15,16,11] => [3,8,2,11,11,15,16,11,2]
  - [9,6,11,4,8,16,5,16,16,10] => [9,6,11,4,8,16,5,16,16,10,11]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [3,13,3,11,3,9,2] => [3,13,3,11,3,9,2,2]
  - [12,7,13,1,5,12] => [12,7,13,1,5,12,2]
  - [2,9,13,16,4,13,16] => [2,9,13,16,4,13,16,2]
- k=3
  - [4] => [4,3]
  - [] => [3]
  - [5] => [5,3]
- k=-2
  - [15,2,16,0,16,8,2] => [15,2,16,0,16,8,2,-2]
  - [10,4,13] => [10,4,13,-2]
  - [8] => [8,-2]
- k=10
  - [14,12,1,5] => [14,12,1,5,10]
  - [2,10,5,13] => [2,10,5,13,10]
  - [3,10,12,1] => [3,10,12,1,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [6,2] => [1,4]
  - [1,6,0] => [3,1,2]
  - [4] => [6]
- k=1, n=10
  - [7,8,6,8,1,6] => [8,9,7,9,2,7]
  - [9,5,6,2,5,6] => [0,6,7,3,6,7]
  - [8,8] => [9,9]
- k=10, n=26
  - [3,2,10,13,15,11] => [13,12,20,23,25,21]
  - [24,15,6] => [8,25,16]
  - [12,0,25,3,8,8,16] => [22,10,9,13,18,18,0]
- k=13, n=26
  - [21,5,10,19,0,17,10] => [8,18,23,6,13,4,23]
  - [14] => [1]
  - [18,9,19] => [5,22,6]


Conceptual dependencies:
- [modulo-k](#modulo-k-parametric)
- [add-k](#add-k-parametric)

### count-head-in-tail

`count-head-in-tail` counts occurrences of the first number in the rest of the list.

Examples:
- [1,1,2] => 1
- [1,2,3] => 0
- [2,1,2] => 1
- [2,3,4] => 0
- [0,5,4,0,2] => 1
- [3,1,3,3,2] => 2
- [4,2,6,10,8,12] => 0


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [count-k](#count-k-parametric)

### count-k (parametric)

`count-k` counts occurrences of the number `k`.

Examples:
- k=2
  - [5,8,1] => 0
  - [11,14,14,4,12,4] => 0
  - [2,2,2,2,2,2] => 6
- k=3
  - [15,4,3,8,4] => 1
  - [] => 0
  - [3,11,7,3,7,6] => 2
- k=10
  - [] => 0
  - [9,10] => 1
  - [10,10,10,14] => 3




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [10,14,3,16] => [3,16]
  - [4,13,5,10,0,8,15,5,10] => [5,10,0,8,15,5,10]
  - [14,12,8,9] => [8,9]
- k=3
  - [7,2,12,10,1,16,10,16] => [10,1,16,10,16]
  - [12,10,0,3,2,6] => [3,2,6]
  - [3,5,5,5] => [5]
- k=5
  - [3,1,16,6,12,3,10,9,3,9,10] => [3,10,9,3,9,10]
  - [9,2,1,12,3,1,11,3] => [1,11,3]
  - [9,13,16,16,11,7,15,16] => [7,15,16]




### dup

`dup` duplicates each element.

Examples:
- [0] => [0,0]
- [7,2,4] => [7,7,2,2,4,4]




### empty

`empty` determines if the list is empty.

Examples:
- [1,2,3] => false
- [] => true
- [0] => false
- [1,1,2,1] => false
- [] => true


Conceptual dependencies:
- [len](#len)

### evens

`evens` gets only even numbers of the list.

Examples:
- [2,0,4] => [2,0,4]
- [2,5,4,2,0,5,1,1] => [2,4,2,0]




### has-head-in-tail

`has-head-in-tail` checks if the first number occurs in the rest of the list.

Examples:
- [1,1,2] => true
- [1,2,3] => false
- [2,1,2] => true
- [2,3,4] => false
- [3,1,3,4,2] => true
- [4,2,6,10,8,12] => false


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [has-k](#has-k-parametric)

### has-k (parametric)

`has-k` checks if the number `k` occurs in the list.

Examples:
- k=2
  - [2,9] => true
  - [] => false
  - [] => false
- k=3
  - [9,12,4,3] => true
  - [15,7,15,1,15,11] => false
  - [10,1,3,7] => true
- k=10
  - [1,14,15] => false
  - [13,8,6,5,10,0,8] => true
  - [10,10,10,10] => true




### head

`head` gets the first element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### identify-gte-k (parametric)

`identify-gte-k` replaces numbers greater than or equal to `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [5,15,8,15,7,9] => [1,1,1,1,1,1]
  - [6,11,4,11,1,6] => [1,1,1,1,0,1]
  - [3,3,3,8,11] => [1,1,1,1,1]
- k=3
  - [11,1] => [1,0]
  - [12,6,10,0,3] => [1,1,1,0,1]
  - [3,3,3] => [1,1,1]
- k=7
  - [2,0] => [0,0]
  - [8] => [1]
  - [5,7,6] => [0,1,0]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [9,1,2,14] => [0,0,1,1]
  - [2,1,13] => [1,0,0]
  - [2] => [1]
- k=3
  - [3,3] => [1,1]
  - [16,2,3,3] => [0,0,1,1]
  - [5,4,16,3,13] => [0,0,0,1,0]
- k=7
  - [16,7,15,13,0,4,3] => [0,1,0,0,1,0,0]
  - [] => []
  - [9,13,7,6,13,4,8] => [0,0,1,0,0,0,0]




### identify-is-prime

`identify-is-prime` replaces prime numbers with 1, leaving all others to 0.

Examples:
- [2] => [1]
- [2,0] => [1,0]
- [5,11] => [1,1]
- [5,11,12] => [1,1,0]
- [2,3,4,5,7,9] => [1,1,0,1,1,0]




### identify-k (parametric)

`identify-k` replaces occurences of `k` with 1, leaving all others to 0.

Examples:
- k=1
  - [3,1,11,5,16] => [0,1,0,0,0]
  - [1,1] => [1,1]
  - [2,0,14,13,12,3,1] => [0,0,0,0,0,0,1]
- k=2
  - [2,2,7] => [1,1,0]
  - [7,9,14,14] => [0,0,0,0]
  - [11,16] => [0,0]
- k=3
  - [6,12] => [0,0]
  - [] => []
  - [] => []
- k=-2
  - [1,11] => [0,0]
  - [6,9,11,3,14,14,1] => [0,0,0,0,0,0,0]
  - [16,-2] => [0,1]
- k=10
  - [] => []
  - [5,13,10,8,11,1] => [0,0,1,0,0,0]
  - [10,10,10] => [1,1,1]




### index-head

`index-head` indexes with first number into the rest of the list, starting at 1.

Examples:
- [1,1,2] => 1
- [1,2,3] => 2
- [2,1,2] => 2
- [2,3,4] => 4
- [3,1,3,4,2] => 4
- [4,2,6,10,8,12] => 8


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [index-k](#index-k-parametric)

### index-k (parametric)

`index-k` get the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [16,8,5,11,11,1] => 8
  - [15,16,12,15,11,7,14,12] => 16
  - [4,15,3,6,13,16,13] => 15
- k=3
  - [13,15,16,7,2,8,1,12] => 16
  - [5,9,14,15,5] => 14
  - [11,5,6,5,15,5,10,5] => 6


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [3,1,5,16] => [3,1,1,1,5,1,16]
  - [] => []
  - [16] => [16]
- k=10
  - [7,1,6,5,13] => [7,10,1,10,6,10,5,10,13]
  - [7,14,0,6,16] => [7,10,14,10,0,10,6,10,16]
  - [11] => [11]
- k=-2
  - [12,9,7] => [12,-2,9,-2,7]
  - [7,5,9,13,15,0,1] => [7,-2,5,-2,9,-2,13,-2,15,-2,0,-2,1]
  - [0] => [0]
- k=0
  - [3,5,7,6,11,1] => [3,0,5,0,7,0,6,0,11,0,1]
  - [7,10,3,9,16] => [7,0,10,0,3,0,9,0,16]
  - [4,7] => [4,0,7]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [26] => true
  - [20,4,4,20,14] => true
  - [18,16,32,32,24,28] => true
- k=3
  - [] => true
  - [9,8] => false
  - [42,27] => true
- k=5
  - [20] => true
  - [14,11,1,5] => false
  - [7] => false


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)
- [identify-is-mod-k](#identify-is-mod-k-parametric)

### is-odds

`is-odds` checks if all numbers of the list are odd.

Examples:
- [2,0,4] => false
- [2,5,4,2,0,5,1,1] => false




### is-primes

`is-primes` checks if all numbers of the list are prime (up to 200).

Examples:
- [2] => true
- [2,0] => false
- [5,11] => true
- [5,11,12] => false


Conceptual dependencies:
- [identify-is-prime](#identify-is-prime)

### is-squares

`is-squares` checks if all numbers of the list are square.

Examples:
- [25] => true
- [3] => false
- [1,4] => true
- [1,4,9] => true
- [1,4,9,15] => false




### keep-mod-head

`keep-mod-head` gets elements after the first number which are divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [3,6,9]
- [4,2,6,10,8,12] => [8,12]
- [1,2,3] => [2,3]


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [keep-mod-k](#keep-mod-k-parametric)

### keep-mod-k (parametric)

`keep-mod-k` gets elements which are divisible by `k`.

Examples:
- k=2
  - [15,1,11,14,6] => [14,6]
  - [4,9,5] => [4]
  - [] => []
- k=3
  - [11,12,10,2,14,16,15] => [12,15]
  - [15] => [15]
  - [4,16,11,9,7] => [9]
- k=5
  - [] => []
  - [5,12,6] => [5]
  - [9] => []


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [14,2,7,5,14,1,11,11] => 14
  - [2,0,10,12] => 10
  - [16,3,1,6,15,6] => 15
- k=3
  - [16,11,15,14,12,15,14,5,12,10] => 15
  - [16,0,1,5,15,15,7,12] => 15
  - [2,14,6,16,0,0,14,15,3] => 14


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [2,2,5,4,14] => 2
  - [12,1,5,14,14,5,15] => 5
  - [2,13,11,13,10] => 10
- k=3
  - [4,10,14,3,6,6,15] => 6
  - [8,14,10,15,16,13] => 13
  - [12,3,11,12,4,1,3,12,9,13] => 3


Conceptual dependencies:
- [min](#min)

### last

`last` gets the last element of the list.

Examples:
- [1,2,3] => 3
- [0] => 0
- [1,1,2,1] => 1




### len

`len` gets the length of the list.

Examples:
- [1,2,3] => 3
- [0] => 1
- [1,1,2,1] => 4




### max

`max` gets the largest element of the list.

Examples:
- [1,2,3] => 3
- [0] => 0
- [1,1,2,1] => 2




### min

`min` gets the smallest element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### modulo-k (parametric)

`modulo-k` expresses each element in the ring of integers modulo `k`.

Examples:
- k=2
  - [6,16,15] => [0,0,1]
  - [0,15,9,4,12,15,6] => [0,1,1,0,0,1,0]
  - [8,13,2,11,2] => [0,1,0,1,0]
- k=3
  - [15,13] => [0,1]
  - [5,0,4,10,6,13,3] => [2,0,1,1,0,1,0]
  - [2,1,11,1] => [2,1,2,1]
- k=10
  - [11,6,2] => [1,6,2]
  - [13,11,6,4,9,14,5] => [3,1,6,4,9,4,5]
  - [] => []




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [5,3,14,10,11,1] => [10,6,28,20,22,2]
  - [6,13,0,5,5] => [12,26,0,10,10]
  - [14,2,8] => [28,4,16]
- k=3
  - [12,14,2,10] => [36,42,6,30]
  - [1,5,11,9,11,7,10] => [3,15,33,27,33,21,30]
  - [0,4] => [0,12]
- k=-2
  - [15,5,14,2] => [-30,-10,-28,-4]
  - [9,12] => [-18,-24]
  - [0,7] => [0,-14]
- k=10
  - [] => []
  - [6,2,13,11,8,9,5] => [60,20,130,110,80,90,50]
  - [9,8,14] => [90,80,140]




### odds

`odds` gets only even numbers of the list.

Examples:
- [1,1,3] => [1,1,3]
- [2,5,4,2,0,5,1,1] => [5,5,1,1]




### pop

`pop` removes the last element of the list.

Examples:
- [1,2,3] => [1,2]
- [0] => []
- [1,1,2,1] => [1,1,2]




### pow-base-k (parametric)

`pow-base-k` exponentiates each element with base `k`. Elements must be nonnegative so the results are integers.

Examples:
- k=2
  - [1,6,8] => [2,64,256]
  - [7,6,1,10,5] => [128,64,2,1024,32]
  - [5,0,7,5,6] => [32,1,128,32,64]
- k=3
  - [9,4,10,9,6,7] => [19683,81,59049,19683,729,2187]
  - [11,6,9,10] => [177147,729,19683,59049]
  - [5,5,3,10] => [243,243,27,59049]
- k=4
  - [5,10,10,7,0,1] => [1024,1048576,1048576,16384,1,4]
  - [9,1,7,3,3] => [262144,4,16384,64,64]
  - [6,4] => [4096,256]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [14] => [196]
  - [11,9,2,5] => [121,81,4,25]
  - [11,5,4,4] => [121,25,16,16]
- k=3
  - [4,10,6,1,10] => [64,1000,216,1,1000]
  - [] => []
  - [16,14,10,13,11] => [4096,2744,1000,2197,1331]
- k=4
  - [13,15,5,9,4,11,15] => [28561,50625,625,6561,256,14641,50625]
  - [9,8,12,9,5,6] => [6561,4096,20736,6561,625,1296]
  - [0,16,11,7,16] => [0,65536,14641,2401,65536]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [5,6,9,16] => [6,5,6,9,16]
  - [3,8,14,3,3,1] => [8,3,8,14,3,3,1]
  - [7,12,14] => [12,7,12,14]
- k=3
  - [10,2,16,16,8,12,7,8,5,1] => [16,10,2,16,16,8,12,7,8,5,1]
  - [3,7,11] => [11,3,7,11]
  - [7,2,13,0,14,15] => [13,7,2,13,0,14,15]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [12,0,9,5,12,16,6] => [2,12,0,9,5,12,16,6]
  - [13,11,6,7,10] => [2,13,11,6,7,10]
  - [10,3,11,14,12,7] => [2,10,3,11,14,12,7]
- k=3
  - [14,7,13,5,9,2,14] => [3,14,7,13,5,9,2,14]
  - [3,1,16,1,2,6] => [3,3,1,16,1,2,6]
  - [13,7,9,3,8] => [3,13,7,9,3,8]
- k=-2
  - [0,3,10] => [-2,0,3,10]
  - [8,12,13,16,8] => [-2,8,12,13,16,8]
  - [12,8,5] => [-2,12,8,5]
- k=10
  - [7,10,12,3] => [10,7,10,12,3]
  - [12,11,11,10,16] => [10,12,11,11,10,16]
  - [16,3,12] => [10,16,3,12]




### product

`product` multiplies all elements of the list.

Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 2




### range

`range` returns a list of numbers from 0 up to – exclusively – the given number.

Examples:
- 0 => []
- 1 => [0]
- 2 => [0,1]
- 3 => [0,1,2]
- 7 => [0,1,2,3,4,5,6]




### remove-index-k (parametric)

`remove-index-k` removes the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [11,15,1,12,8] => [11,1,12,8]
  - [0,7,4,0] => [0,4,0]
  - [10,1,13,15,10,14,3] => [10,13,15,10,14,3]
- k=3
  - [13,4,9,2,5,1] => [13,4,2,5,1]
  - [14,3,10,7,0,4,9,0] => [14,3,7,0,4,9,0]
  - [0,1,10] => [0,1]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### remove-mod-head

`remove-mod-head` gets elements after the first number which are not divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [1,4,7,2]
- [4,2,6,10,8,12] => [2,6,10]
- [1,2,3] => []


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [remove-mod-k](#remove-mod-k-parametric)

### remove-mod-k (parametric)

`remove-mod-k` gets elements which are not divisible by `k`.

Examples:
- k=2
  - [8,15,0] => [15]
  - [6,10,14,7] => [7]
  - [5,15] => [5,15]
- k=3
  - [27] => []
  - [10,6] => [10]
  - [24,4,15,4,3,11,16] => [4,4,11,16]
- k=5
  - [11,1,14,1,7,7,10] => [11,1,14,1,7,7]
  - [7,1,8,10,0,9] => [7,1,8,9]
  - [2,3,2] => [2,3,2]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### repeat

`repeat` creates a list, of size equal to the first element, filled with the second element

Examples:
- [1,1] => [1]
- [1,2] => [2]
- [1,3] => [3]
- [2,1] => [1,1]
- [2,3] => [3,3]
- [3,7] => [7,7,7]
- [6,13] => [13,13,13,13,13,13]


Conceptual dependencies:
- [head](#head)
- [repeat-k](#repeat-k-parametric)

### repeat-k (parametric)

`repeat-k` repeats the given list `k` times.

Examples:
- k=2
  - [10] => [10,10]
  - [8,0,12,2] => [8,0,12,2,8,0,12,2]
  - [0,8,11] => [0,8,11,0,8,11]
- k=3
  - [15,11,11,1,16] => [15,11,11,1,16,15,11,11,1,16,15,11,11,1,16]
  - [6,14] => [6,14,6,14,6,14]
  - [] => []
- k=5
  - [10,15,7,10] => [10,15,7,10,10,15,7,10,10,15,7,10,10,15,7,10,10,15,7,10]
  - [] => []
  - [] => []




### repeat-many

`repeat-many` creates a list by repeating the tail of the list as many times as indicated by the first element of the list.

Examples:
- [1,1,2,3] => [1,2,3]
- [2,1,2,3] => [1,2,3,1,2,3]
- [4,1,2] => [1,2,1,2,1,2,1,2]
- [5,7,0] => [7,0,7,0,7,0,7,0,7,0]
- [3,3,2,5] => [3,2,5,3,2,5,3,2,5]
- [5,1] => [1,1,1,1,1]


Conceptual dependencies:
- [repeat-k](#repeat-k-parametric)
- [head](#head)
- [tail](#tail)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [10,1,15,6,1,4,2] => [10,2,15,6,2,4,2]
  - [8,0,6,15,10,8,8] => [8,0,6,15,10,8,8]
  - [0,0,10,13,2] => [0,0,10,13,2]
- k=2, n=10
  - [9,14] => [9,14]
  - [3,12,13,12] => [3,12,13,12]
  - [7,6,8,2,5] => [7,6,8,10,5]
- k=3, n=-2
  - [10,6,16,4] => [10,6,16,4]
  - [12,2,1,10,5,3,8] => [12,2,1,10,5,-2,8]
  - [15,9,12,9] => [15,9,12,9]
- k=5, n=0
  - [] => []
  - [2,5,5,3,13,2] => [2,0,0,3,13,2]
  - [15,1,9,13,5] => [15,1,9,13,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [13,16,9,13,0,8] => [13,13,13,13,13,13]
  - [14,11,6] => [14,14,14]
  - [12,2,8,11] => [12,12,12,12]
- k=2
  - [12,9,11,8,11,8,2,1] => [9,9,9,9,9,9,9,9]
  - [8,12,4,11,0] => [12,12,12,12,12]
  - [10,8,6,15,1,6] => [8,8,8,8,8,8]
- k=3
  - [12,5,2,16,6,5,11,15] => [2,2,2,2,2,2,2,2]
  - [16,8,13] => [13,13,13]
  - [1,16,2,12,4,3,15,15,3,0] => [2,2,2,2,2,2,2,2,2,2]
- k=5
  - [4,8,4,13,11,8,8,15,0] => [11,11,11,11,11,11,11,11,11]
  - [12,13,15,1,14,6,0,13,2,12] => [14,14,14,14,14,14,14,14,14,14]
  - [15,14,10,8,14,7,0] => [14,14,14,14,14,14,14]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [13,16,9,3,16] => [2,16,9,3,16]
  - [16,14,5,6] => [2,14,5,6]
  - [9,10,7,10] => [2,10,7,10]
- k=2, n=10
  - [4,6,8,14,1] => [4,10,8,14,1]
  - [10,9,1,10,13] => [10,10,1,10,13]
  - [5,14,3,16,3,3,4,13] => [5,10,3,16,3,3,4,13]
- k=3, n=-2
  - [11,9,6,8,13,11,10,11,0,14] => [11,9,-2,8,13,11,10,11,0,14]
  - [10,14,4,8,3,13,6,5,0,12] => [10,14,-2,8,3,13,6,5,0,12]
  - [6,12,10,12,2] => [6,12,-2,12,2]
- k=5, n=0
  - [8,15,16,3,9,13] => [8,15,16,3,0,13]
  - [14,8,3,11,16,9,7,7] => [14,8,3,11,0,9,7,7]
  - [3,9,12,4,12,12,1,3,8,14,9,12] => [3,9,12,4,0,12,1,3,8,14,9,12]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### reverse

`reverse` reverses the list.

Examples:
- [2,0,4] => [4,0,2]
- [2,5,4,2,0,5,1,1] => [1,1,5,0,2,4,5,2]




### rotate-k (parametric)

`rotate-k` shifts number placements forward by `k` (shifts backward if `k` is negative).

Examples:
- k=1
  - [8,13,14,7] => [7,8,13,14]
  - [] => []
  - [9,16,3] => [3,9,16]
- k=3
  - [8,4,0,5,9] => [0,5,9,8,4]
  - [7] => [7]
  - [] => []
- k=-2
  - [15,0,1,1,3,11,7] => [1,1,3,11,7,15,0]
  - [5,4,16,3,6,14] => [16,3,6,14,5,4]
  - [4,1,3,8,6] => [3,8,6,4,1]
- k=10
  - [3,1,1] => [1,3,1]
  - [0,0,14,6,2,7] => [14,6,2,7,0,0]
  - [15,2,11,10,15,10] => [11,10,15,10,15,2]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [14,12,3,6,2,10] => [12,3]
  - [6,14,10,3,15,1,4,13,5,1,12,9] => [14,10]
  - [5,11,16,6,8,10,4,2,6,8] => [11,16]
- k=2, n=3
  - [2,8,1,0,11,10,12,14] => [8,1,0]
  - [11,7,0,8,4,13,8,8,8,5,10] => [7,0,8]
  - [5,11,14,14,16,6,16,7,7,12,11,16,10] => [11,14,14]
- k=3, n=3
  - [12,4,5,11,5,14,14,8,7,9,13,7,13] => [5,11,5]
  - [16,4,0,3,10,9,15,12,10] => [0,3,10]
  - [10,4,0,12,10,11,7,11] => [0,12,10]
- k=3, n=4
  - [6,10,6,7,13,5,12,6,11,14,1,6,5,4] => [6,7,13,5]
  - [4,6,12,9,3,14,7,2,4,15,11,14] => [12,9,3,14]
  - [14,12,14,13,14,11,7,3,16,12,5,15,0] => [14,13,14,11]


Conceptual dependencies:
- [index-k](#index-k-parametric)
- [take-k](#take-k-parametric)

### sort

`sort` sorts the list.

Examples:
- [2,0,4] => [0,2,4]
- [2,5,4,2,0,5,1,1] => [0,1,1,2,2,4,5,5]




### sum

`sum` adds all elements of the list.

Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 5




### tail

`tail` gets numbers in the list after the first number.

Examples:
- [5,9,1] => [9,1]
- [12,4] => [4]
- [2,3,6,7] => [3,6,7]




### take-k (parametric)

`take-k` gets the first `k` numbers of the list.

Examples:
- k=2
  - [3,15] => [3,15]
  - [8,6] => [8,6]
  - [2,1,2,16,0,3,8,2,0] => [2,1]
- k=3
  - [10,12,3,1,4,15,1,9,7,16] => [10,12,3]
  - [7,6,2,3,8,4,15,15,16,7] => [7,6,2]
  - [7,3,13,13,2,6,9,14,6] => [7,3,13]
- k=5
  - [11,13,5,2,4,3] => [11,13,5,2,4]
  - [4,9,14,14,2,9,14,14,0,7,16] => [4,9,14,14,2]
  - [14,0,6,7,16,5] => [14,0,6,7,16]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




