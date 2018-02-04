# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [6,9] => [7,10]
  - [7] => [8]
  - [14,12,7,16,13] => [15,13,8,17,14]
- k=2
  - [11] => [13]
  - [15,5,16,3,4,12,7] => [17,7,18,5,6,14,9]
  - [0,11,9] => [2,13,11]
- k=3
  - [9,13,5,1,2,6,14] => [12,16,8,4,5,9,17]
  - [] => []
  - [7,10,15,2] => [10,13,18,5]
- k=-2
  - [2,12,13,12,9,10,6] => [0,10,11,10,7,8,4]
  - [0,1,12,9] => [-2,-1,10,7]
  - [11,6,7,2] => [9,4,5,0]
- k=10
  - [] => []
  - [10,15,16] => [20,25,26]
  - [1] => [11]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [13,13,10,10,15,12,8,12,3] => [13,13,10,10,15,12,8,12,3,13]
  - [15,11,14,16,13,16] => [15,11,14,16,13,16,11]
  - [7,10,2,13,9,7,16] => [7,10,2,13,9,7,16,10]
- k=3
  - [1,12,12,15,16,6,7,14,5,10] => [1,12,12,15,16,6,7,14,5,10,12]
  - [3,14,16,2,3,4] => [3,14,16,2,3,4,16]
  - [0,7,16,0,5,6,6,7,16] => [0,7,16,0,5,6,6,7,16,16]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [7,4,10] => [7,4,10,2]
  - [1,5,4,0,12,10,15] => [1,5,4,0,12,10,15,2]
  - [9,15,11,15] => [9,15,11,15,2]
- k=3
  - [8,10,13] => [8,10,13,3]
  - [1,11,10,16,0,2] => [1,11,10,16,0,2,3]
  - [9] => [9,3]
- k=-2
  - [8,13,3,9] => [8,13,3,9,-2]
  - [7,6,4] => [7,6,4,-2]
  - [6,11,7] => [6,11,7,-2]
- k=10
  - [2,9,15,6,14] => [2,9,15,6,14,10]
  - [13,10] => [13,10,10]
  - [13,15] => [13,15,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [5,0,2] => [0,2,4]
  - [4,0,2] => [6,2,4]
  - [] => []
- k=1, n=10
  - [9,6,5,0,8] => [0,7,6,1,9]
  - [3,4,7,8,5,7] => [4,5,8,9,6,8]
  - [3] => [4]
- k=10, n=26
  - [22,10] => [6,20]
  - [1,14,18,3,5] => [11,24,2,13,15]
  - [5,20,7,14,8,2,16] => [15,4,17,24,18,12,0]
- k=13, n=26
  - [5,9,3,4,3,14,18] => [18,22,16,17,16,1,5]
  - [23,9,24,4,15,6,11] => [10,22,11,17,2,19,24]
  - [17,1] => [4,14]


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
  - [2,7,0] => 1
  - [3,0,4,14,15,16,5] => 0
  - [] => 0
- k=3
  - [13,5,11,0] => 0
  - [15] => 0
  - [14] => 0
- k=10
  - [12,2,16,10,1] => 1
  - [3,5,3,15,3,15,12] => 0
  - [9,15,6,0] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [7,6,3,4,8,9,9,2] => [3,4,8,9,9,2]
  - [0,13,15,14] => [15,14]
  - [0,12,10,2,1,15,15,16,1] => [10,2,1,15,15,16,1]
- k=3
  - [0,2,8,1,6,1,0,2] => [1,6,1,0,2]
  - [10,11,10,8] => [8]
  - [0,11,10] => []
- k=5
  - [15,10,8,16,10,8,0,12,12,16] => [8,0,12,12,16]
  - [0,14,5,6,10,8,10,4] => [8,10,4]
  - [6,12,5,1,1,16,10,12,10] => [16,10,12,10]




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




### fibonacci

`fibonacci` returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.

Examples:
- 2 => 1
- 4 => 3
- 6 => 8
- 9 => 34




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
  - [4,2,4] => true
  - [15,16] => false
  - [2,2,1,2,2,2,0] => true
- k=3
  - [15,3,3,3,7] => true
  - [3,3,2,7] => true
  - [7,15,11] => false
- k=10
  - [8,6,6,5,10,3] => true
  - [9] => false
  - [16,9,10,4,11,16,4] => true




### head

`head` gets the first element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### identify-geq-k (parametric)

`identify-geq-k` replaces numbers greater than or equal to `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [1,3,12,1,16] => [0,1,1,0,1]
  - [2,8,14,15,2,2] => [1,1,1,1,1,1]
  - [8,1,-2,5,5,13] => [1,0,0,1,1,1]
- k=3
  - [2,2,2,13,8] => [0,0,0,1,1]
  - [] => []
  - [4] => [1]
- k=7
  - [14,11,11,8,1] => [1,1,1,1,0]
  - [16,16,11,16,7,16] => [1,1,1,1,1,1]
  - [5,12,13,5,14,9,8] => [0,1,1,0,1,1,1]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [6,15,15,13,4,12] => [1,0,0,0,1,1]
  - [6,3,9,10,1,10,0] => [1,0,0,1,0,1,1]
  - [3,9,10,8,13,5,1] => [0,0,1,1,0,0,0]
- k=3
  - [11,2,4,10,15] => [0,0,0,0,1]
  - [12,15] => [1,1]
  - [9,13,15,14,3,6,3] => [1,0,1,0,1,1,1]
- k=7
  - [7,7,7,8] => [1,1,1,0]
  - [7,7,13,7] => [1,1,0,1]
  - [] => []




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
  - [1] => [1]
  - [1,8,1] => [1,0,1]
  - [1,15,1,2] => [1,0,1,0]
- k=2
  - [11,4,4,14,9,6] => [0,0,0,0,0,0]
  - [10,13] => [0,0]
  - [13,12] => [0,0]
- k=3
  - [3,3,3,3,9] => [1,1,1,1,0]
  - [3] => [1]
  - [10,7] => [0,0]
- k=-2
  - [-2] => [1]
  - [-2,-2,10,3,-2,13] => [1,1,0,0,1,0]
  - [12] => [0]
- k=10
  - [7] => [0]
  - [16,13,12] => [0,0,0]
  - [10,10] => [1,1]




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
  - [3,13,4,6,11,16,7,13] => 13
  - [13,1,2,12,11,11] => 1
  - [15,15,10,3,6,1] => 15
- k=3
  - [15,15,11,2,1,14,11,15] => 11
  - [0,15,16,2,9,12,0,16] => 16
  - [12,0,6,1] => 6


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [9,6,1,15,3,10,5] => [9,1,6,1,1,1,15,1,3,1,10,1,5]
  - [11] => [11]
  - [0,1] => [0,1,1]
- k=10
  - [] => []
  - [12,6,8,9] => [12,10,6,10,8,10,9]
  - [2] => [2]
- k=-2
  - [] => []
  - [7,3,7,6] => [7,-2,3,-2,7,-2,6]
  - [8,1,9,12] => [8,-2,1,-2,9,-2,12]
- k=0
  - [10,16,0,11,9] => [10,0,16,0,0,0,11,0,9]
  - [14,4,9,8,8,0] => [14,0,4,0,9,0,8,0,8,0,0]
  - [12,4,12] => [12,0,4,0,12]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [16,10,12,10,6] => true
  - [14,10,12,26,2,16,32] => true
  - [6,10,4] => true
- k=3
  - [15,11,6] => false
  - [15,13,15,7,6] => false
  - [3] => true
- k=5
  - [15,80,45] => true
  - [80,10,45,25,50] => true
  - [60,5,15,20,20,65,45] => true


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
  - [15,12,16,10] => [12,16,10]
  - [] => []
  - [16,14,0] => [16,14,0]
- k=3
  - [4,21,3,9,12] => [21,3,9,12]
  - [4,12,11] => [12]
  - [] => []
- k=5
  - [5] => [5]
  - [12,2,16,13,9,6] => []
  - [11] => []


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [7,15,13,8,10,9,11,14,3] => 14
  - [16,15,7,7,5,5] => 15
  - [3,5,9,1,12] => 9
- k=3
  - [9,15,8,15,11,12] => 12
  - [14,9,15,0,5] => 9
  - [10,15,13,16,14,16,13,4,3] => 15


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [4,7,7] => 7
  - [3,5] => 5
  - [4,7,13,13] => 7
- k=3
  - [15,6,4,13,2,1] => 4
  - [11,15,1,6,7,16,16] => 7
  - [11,5,9] => 11


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
  - [11,11,9] => [1,1,1]
  - [2,0,9] => [0,0,1]
  - [6] => [0]
- k=3
  - [13,15,15] => [1,0,0]
  - [3,6,9,12,16] => [0,0,0,0,1]
  - [8,11,10,12,4,7,1] => [2,2,1,0,1,1,1]
- k=10
  - [] => []
  - [11] => [1]
  - [0,1,1,4,0] => [0,1,1,4,0]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [16] => [32]
  - [4,3,13] => [8,6,26]
  - [14,4,0,9,9,10,14] => [28,8,0,18,18,20,28]
- k=3
  - [8,2] => [24,6]
  - [15,10] => [45,30]
  - [4,2,5,3,14,12,4] => [12,6,15,9,42,36,12]
- k=-2
  - [] => []
  - [6,7,9,3,15,10] => [-12,-14,-18,-6,-30,-20]
  - [14,9,14] => [-28,-18,-28]
- k=10
  - [10,13,5,0,14,2] => [100,130,50,0,140,20]
  - [7,5,12] => [70,50,120]
  - [10,6,14,11,11] => [100,60,140,110,110]




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
  - [] => []
  - [9] => [512]
  - [10,8] => [1024,256]
- k=3
  - [] => []
  - [1,3] => [3,27]
  - [9,2,10] => [19683,9,59049]
- k=4
  - [1,5,4] => [4,1024,256]
  - [2,6,3,7,6,11] => [16,4096,64,16384,4096,4194304]
  - [9,8,5,0,11] => [262144,65536,1024,1,4194304]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [6,5,6,2] => [36,25,36,4]
  - [15] => [225]
  - [5,5,4,2,2,13,8] => [25,25,16,4,4,169,64]
- k=3
  - [11,13,1,3,1,10] => [1331,2197,1,27,1,1000]
  - [11,11,14,7,11] => [1331,1331,2744,343,1331]
  - [0,13,14,12,4] => [0,2197,2744,1728,64]
- k=4
  - [2,11,12,10,2,4] => [16,14641,20736,10000,16,256]
  - [] => []
  - [9,15] => [6561,50625]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [2,12,5] => [12,2,12,5]
  - [11,2] => [2,11,2]
  - [15,3] => [3,15,3]
- k=3
  - [16,0,8,15,6,0,15,4,7] => [8,16,0,8,15,6,0,15,4,7]
  - [9,7,6,12,15] => [6,9,7,6,12,15]
  - [2,6,8,2] => [8,2,6,8,2]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [8,4,14,12,3,4,15] => [2,8,4,14,12,3,4,15]
  - [10,10,10,6,2,5] => [2,10,10,10,6,2,5]
  - [1,14] => [2,1,14]
- k=3
  - [5,15,0] => [3,5,15,0]
  - [5,6,1,10,16,4,7] => [3,5,6,1,10,16,4,7]
  - [13] => [3,13]
- k=-2
  - [2] => [-2,2]
  - [6,9,11,2] => [-2,6,9,11,2]
  - [0,8,14,5,6,14] => [-2,0,8,14,5,6,14]
- k=10
  - [11,0,7,2,12,6,3] => [10,11,0,7,2,12,6,3]
  - [10,6,2,14,7,6] => [10,10,6,2,14,7,6]
  - [3,4,14] => [10,3,4,14]




### prime

`prime` returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.

Examples:
- 1 => 2
- 2 => 3
- 3 => 5
- 7 => 17




### prime-largest-less-than

`prime-largest-less-than` returns the largest prime number less than the given number.

Examples:
- 3 => 2
- 4 => 3
- 7 => 5
- 8 => 7
- 13 => 11
- 20 => 19




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
  - [16,1,12,3] => [16,12,3]
  - [11,10,3,9] => [11,3,9]
  - [4,9,5,7,1,10,3] => [4,5,7,1,10,3]
- k=3
  - [10,9,8,15,16,16,1,16,6,14] => [10,9,15,16,16,1,16,6,14]
  - [7,10,9,2] => [7,10,2]
  - [14,1,5,13,11,0,0,5,2,14] => [14,1,13,11,0,0,5,2,14]


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
  - [10,7,0,10,13,18] => [7,13]
  - [6,10,6,0,16] => []
  - [13,5,2,6,1,9] => [13,5,1,9]
- k=3
  - [16,0,12,7] => [16,7]
  - [12,10] => [10]
  - [4,15,27,18,13,9] => [4,13]
- k=5
  - [2,14,10,5,16] => [2,14,16]
  - [10,5,11,3,1] => [11,3,1]
  - [3,0] => [3]


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
  - [1,0,1,2] => [1,0,1,2,1,0,1,2]
  - [] => []
  - [10] => [10,10]
- k=3
  - [12] => [12,12,12]
  - [1,2,16,12] => [1,2,16,12,1,2,16,12,1,2,16,12]
  - [7,4,13,13] => [7,4,13,13,7,4,13,13,7,4,13,13]
- k=5
  - [10,1,6] => [10,1,6,10,1,6,10,1,6,10,1,6,10,1,6]
  - [9,15,10,4] => [9,15,10,4,9,15,10,4,9,15,10,4,9,15,10,4,9,15,10,4]
  - [14,0] => [14,0,14,0,14,0,14,0,14,0]




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
  - [5,8,8] => [5,8,8]
  - [6,1,0,15,4] => [6,2,0,15,4]
  - [16,12,5,15,2] => [16,12,5,15,2]
- k=2, n=10
  - [15,16,8,2,0,2,1] => [15,16,8,10,0,10,1]
  - [2,2] => [10,10]
  - [] => []
- k=3, n=-2
  - [3,3] => [-2,-2]
  - [6,8,16,12,3] => [6,8,16,12,-2]
  - [3,6,3,3,3,3,3] => [-2,6,-2,-2,-2,-2,-2]
- k=5, n=0
  - [5,5,5,5,5,5] => [0,0,0,0,0,0]
  - [0,7,2,8] => [0,7,2,8]
  - [1,2,12] => [1,2,12]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [12,10,15,0] => [12,12,12,12]
  - [15,4,6,2] => [15,15,15,15]
  - [9,15,3,13,11] => [9,9,9,9,9]
- k=2
  - [3,10,1] => [10,10,10]
  - [1,10,7] => [10,10,10]
  - [12,15,9,8,14] => [15,15,15,15,15]
- k=3
  - [2,8,6,13,4,16] => [6,6,6,6,6,6]
  - [13,12,5,3,10,12,11,13,0,13] => [5,5,5,5,5,5,5,5,5,5]
  - [13,15,9,11,0,10,16,1] => [9,9,9,9,9,9,9,9]
- k=5
  - [14,9,8,16,4,6,6,3,3] => [4,4,4,4,4,4,4,4,4]
  - [10,9,9,8,8,9,16,12,1,9,6,0] => [8,8,8,8,8,8,8,8,8,8,8,8]
  - [7,6,7,12,11] => [11,11,11,11,11]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [16] => [2]
  - [2,0] => [2,0]
  - [10] => [2]
- k=2, n=10
  - [5,1,13,2,3] => [5,10,13,2,3]
  - [5,7,12,9,7,15,14,2,1] => [5,10,12,9,7,15,14,2,1]
  - [15,12,16,15,4,1,6,16,13] => [15,10,16,15,4,1,6,16,13]
- k=3, n=-2
  - [4,13,11,16,3,1,2] => [4,13,-2,16,3,1,2]
  - [6,3,7,14,2,5,8,15] => [6,3,-2,14,2,5,8,15]
  - [1,2,2] => [1,2,-2]
- k=5, n=0
  - [5,14,13,11,7] => [5,14,13,11,0]
  - [1,3,3,3,2,14,7,6,15,3,5,12] => [1,3,3,3,0,14,7,6,15,3,5,12]
  - [11,15,8,8,8,2] => [11,15,8,8,0,2]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### replace-k-with-n (parametric)

`replace-k-with-n` returns `n` if supplied `k`, otherwise returns the given number.

Examples:
- k=1, n=2
  - 0 => 0
  - 13 => 13
  - 5 => 5
- k=2, n=10
  - 2 => 10
  - 15 => 15
  - 1 => 1
- k=3, n=-2
  - 13 => 13
  - 10 => 10
  - 3 => -2
- k=5, n=0
  - 5 => 0
  - 4 => 4
  - 13 => 13




### reverse

`reverse` reverses the list.

Examples:
- [2,0,4] => [4,0,2]
- [2,5,4,2,0,5,1,1] => [1,1,5,0,2,4,5,2]




### rotate-k (parametric)

`rotate-k` shifts number placements forward by `k` (shifts backward if `k` is negative).

Examples:
- k=1
  - [0] => [0]
  - [9,13,14,3,10] => [10,9,13,14,3]
  - [13,14,3,9,4] => [4,13,14,3,9]
- k=3
  - [9,5,11,10,0,12,5] => [0,12,5,9,5,11,10]
  - [1,9,2,7] => [9,2,7,1]
  - [11] => [11]
- k=-2
  - [8] => [8]
  - [14,4,16,3,9,0] => [16,3,9,0,14,4]
  - [16] => [16]
- k=10
  - [5,11] => [5,11]
  - [7,10,13,8,11] => [7,10,13,8,11]
  - [7] => [7]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [2,0,12,4,1,3,5,6,6,13,1] => [0,12]
  - [16,9,0,12,15,1,13] => [9,0]
  - [0,2,3,2,4,14] => [2,3]
- k=2, n=3
  - [2,9,2,3,8,15,3,6,12,11] => [9,2,3]
  - [2,15,7,3,4,5,10,11,16,3,0,13] => [15,7,3]
  - [2,14,14,0,7,3,12,4,12,3,11,13] => [14,14,0]
- k=3, n=3
  - [8,10,13,6,9,14,15,7,5,9] => [13,6,9]
  - [2,14,0,0,1,8,1,12,4,4,6,2,11,8] => [0,0,1]
  - [16,11,2,7,13,13,11,3,11,11,7,8] => [2,7,13]
- k=3, n=4
  - [5,16,9,11,13,7,4,2,7,14,12,7] => [9,11,13,7]
  - [3,14,11,12,10,4,12,6,2,0,13] => [11,12,10,4]
  - [5,4,1,2,3,8,3,6,7,8,13,7] => [1,2,3,8]


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
  - [1,16,9,3,14] => [1,16]
  - [4,11,12] => [4,11]
  - [3,15,7,10,8,1] => [3,15]
- k=3
  - [14,16,6,6,7,10,14] => [14,16,6]
  - [3,16,15,8,1,13] => [3,16,15]
  - [13,2,16,7,8,2,13,5,8,8] => [13,2,16]
- k=5
  - [6,3,16,2,15,1] => [6,3,16,2,15]
  - [7,1,5,0,11,4,7] => [7,1,5,0,11]
  - [14,0,11,4,9,11,1,15,7] => [14,0,11,4,9]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




