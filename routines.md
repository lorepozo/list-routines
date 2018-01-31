# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [11,6,10,12,11,5,7] => [12,7,11,13,12,6,8]
  - [1,11,8,12,2,16] => [2,12,9,13,3,17]
  - [3,12,12,1,12] => [4,13,13,2,13]
- k=2
  - [4,2,2,0,6,8,3] => [6,4,4,2,8,10,5]
  - [5,11,14,5,15] => [7,13,16,7,17]
  - [15,1,11,7,14] => [17,3,13,9,16]
- k=3
  - [14,16,5,13,11,10] => [17,19,8,16,14,13]
  - [5] => [8]
  - [] => []
- k=-2
  - [15,7,3,11,1,5,2] => [13,5,1,9,-1,3,0]
  - [1,5,16,2,4,13,11] => [-1,3,14,0,2,11,9]
  - [3] => [1]
- k=10
  - [8,12] => [18,22]
  - [12] => [22]
  - [] => []




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [2,6,6,8,16] => [2,6,6,8,16,6]
  - [0,3,5,15,1] => [0,3,5,15,1,3]
  - [1,12,13,10,14] => [1,12,13,10,14,12]
- k=3
  - [0,7,6,16] => [0,7,6,16,6]
  - [15,10,15,5,8,15,6,13,15] => [15,10,15,5,8,15,6,13,15,15]
  - [11,8,12,6,4,12,2,1] => [11,8,12,6,4,12,2,1,12]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,10,13,12,9,8] => [5,10,13,12,9,8,2]
  - [] => [2]
  - [16,12,15,8,16,12] => [16,12,15,8,16,12,2]
- k=3
  - [0,14] => [0,14,3]
  - [7,13,5,4,2] => [7,13,5,4,2,3]
  - [16,8,4,8,11,7,3] => [16,8,4,8,11,7,3,3]
- k=-2
  - [13,4,9,10] => [13,4,9,10,-2]
  - [] => [-2]
  - [1,14,6,13,3] => [1,14,6,13,3,-2]
- k=10
  - [5,3,6,3,6,2] => [5,3,6,3,6,2,10]
  - [7,6] => [7,6,10]
  - [14,16,3] => [14,16,3,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [1,4,3,5,2] => [3,6,5,0,4]
  - [1,2,0,3,4] => [3,4,2,5,6]
  - [6] => [1]
- k=1, n=10
  - [0,9,5,6,8] => [1,0,6,7,9]
  - [8,8] => [9,9]
  - [3,9] => [4,0]
- k=10, n=26
  - [16,17,10] => [0,1,20]
  - [14,17,1,25] => [24,1,11,9]
  - [] => []
- k=13, n=26
  - [25,0,7] => [12,13,20]
  - [12,24,6,12,12] => [25,11,19,25,25]
  - [1,24,20] => [14,11,7]


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
  - [8,3,8] => 0
  - [5,14,1] => 0
  - [14,11,14,16] => 0
- k=3
  - [3,4,16] => 1
  - [0,7,7,5,14,1,11] => 0
  - [3] => 1
- k=10
  - [10,12,3,15,12,1,15] => 1
  - [] => 0
  - [16,5,5] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [8,14,10,1,7] => [10,1,7]
  - [4,6,5,0,12,14] => [5,0,12,14]
  - [2,8] => []
- k=3
  - [5,16,10,0,14,2] => [0,14,2]
  - [1,0,12,8,7,3,13,12,1] => [8,7,3,13,12,1]
  - [2,3,1,6,6,1,8,1,1] => [6,6,1,8,1,1]
- k=5
  - [7,6,7,3,5,5,6,16] => [5,6,16]
  - [2,1,11,15,11,0,5,16,16,5,14,16] => [0,5,16,16,5,14,16]
  - [7,4,15,5,4,2,13,4,4] => [2,13,4,4]




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
  - [10,15,13,16,6,12] => false
  - [0,15,10,15,10] => false
  - [16,10,8,5,2] => true
- k=3
  - [3,5,3,3,3,2,3] => true
  - [3,0,3] => true
  - [8] => false
- k=10
  - [1,5,2] => false
  - [6,16,11,10,16] => true
  - [2,14,10,11,12,11] => true




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
  - [2,12,7,4,1,14,15] => [1,1,1,1,0,1,1]
  - [-2] => [0]
  - [11,3,3] => [1,1,1]
- k=3
  - [1,8,14,14,11] => [0,1,1,1,1]
  - [13,12,7,15,14,6,9] => [1,1,1,1,1,1,1]
  - [13,10,6,16,3,5] => [1,1,1,1,1,1]
- k=7
  - [11,13,7,5] => [1,1,1,0]
  - [5,4,7] => [0,0,1]
  - [0,1] => [0,0]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [0] => [1]
  - [2,10,2,2,2] => [1,1,1,1,1]
  - [] => []
- k=3
  - [9,8,6,7] => [1,0,1,0]
  - [1,3,3,0,3,14,3] => [0,1,1,1,1,0,1]
  - [11,8,16,5,15,1,2] => [0,0,0,0,1,0,0]
- k=7
  - [3,8,15,5] => [0,0,0,0]
  - [11] => [0]
  - [2,10,1,4,12,8] => [0,0,0,0,0,0]




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
  - [4,9,9,8] => [0,0,0,0]
  - [1,1,1,1,1] => [1,1,1,1,1]
  - [2,10,7,13,3,6] => [0,0,0,0,0,0]
- k=2
  - [2,5,2,2,4,2] => [1,0,1,1,0,1]
  - [7,12] => [0,0]
  - [8,3,9,4] => [0,0,0,0]
- k=3
  - [9,7,11] => [0,0,0]
  - [15,12] => [0,0]
  - [8,7,3,13,6,14] => [0,0,1,0,0,0]
- k=-2
  - [2,13,16,15,8,11,10] => [0,0,0,0,0,0,0]
  - [8,7,9,1,13] => [0,0,0,0,0]
  - [-2,8] => [1,0]
- k=10
  - [10,8,10,10,5] => [1,0,1,1,0]
  - [10,10] => [1,1]
  - [1,3,11,8,0,1,7] => [0,0,0,0,0,0,0]




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
  - [9,14,3] => 14
  - [14,1,9] => 1
  - [4,8,8,4,16,15,8,4,3] => 8
- k=3
  - [16,3,7,7,6,11,5,15] => 7
  - [2,9,4,5,5,2] => 4
  - [7,4,5,15,15,4,4,2,2,9] => 5


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [16,12,16] => [16,1,12,1,16]
  - [16,5,5,13,4] => [16,1,5,1,5,1,13,1,4]
  - [1,15,0,1] => [1,1,15,1,0,1,1]
- k=10
  - [10,13,0,8,1] => [10,10,13,10,0,10,8,10,1]
  - [13,8,4,16,0,8] => [13,10,8,10,4,10,16,10,0,10,8]
  - [] => []
- k=-2
  - [13,10] => [13,-2,10]
  - [13] => [13]
  - [10,7,7,2,13] => [10,-2,7,-2,7,-2,2,-2,13]
- k=0
  - [6,6,8] => [6,0,6,0,8]
  - [14,2,6,8,13,11] => [14,0,2,0,6,0,8,0,13,0,11]
  - [8,3,7,15,16,9] => [8,0,3,0,7,0,15,0,16,0,9]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [28] => true
  - [1,7,2,9,16] => false
  - [26,18,30,16,6,26] => true
- k=3
  - [9,8,0,4,3,15] => false
  - [42,42,30,42] => true
  - [4,13,7,11,10,10,11] => false
- k=5
  - [] => true
  - [10,4,9,14] => false
  - [0,80,50,55] => true


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
  - [2,11,16,2,6] => [2,16,2,6]
  - [9,8,7] => [8]
  - [2,0,5] => [2,0]
- k=3
  - [8] => []
  - [7,9,3] => [9,3]
  - [1,16,10] => []
- k=5
  - [7] => []
  - [] => []
  - [40,10,9] => [40,10]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [4,16,6,9,13,15,11] => 15
  - [13,1,0,15,16] => 15
  - [8,12,12,8,11,0] => 12
- k=3
  - [15,15,2,1,11,11] => 11
  - [16,11,8,9,14,0,10,1,12] => 12
  - [6,15,13] => 6


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [6,4,13,13,9,0,8] => 4
  - [10,13,9,7] => 9
  - [14,4,1,0,15,8,10] => 1
- k=3
  - [7,1,8] => 8
  - [0,12,13,9,5,6] => 6
  - [2,16,9,11,5,8] => 8


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
  - [7,6,9] => [1,0,1]
  - [0,6,1,0,12,3] => [0,0,1,0,0,1]
  - [16,5,8,2] => [0,1,0,0]
- k=3
  - [6,16,5,13,11,10,8] => [0,1,2,1,2,1,2]
  - [0,15,13] => [0,0,1]
  - [14,10,10,5,1] => [2,1,1,2,1]
- k=10
  - [11,6,13,12,2,10,0] => [1,6,3,2,2,0,0]
  - [1,16,12] => [1,6,2]
  - [] => []




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [12,1,11,3] => [24,2,22,6]
  - [] => []
  - [11,2] => [22,4]
- k=3
  - [15,16,3,2] => [45,48,9,6]
  - [8] => [24]
  - [] => []
- k=-2
  - [9,13] => [-18,-26]
  - [] => []
  - [8,14,3,5,1,14,7] => [-16,-28,-6,-10,-2,-28,-14]
- k=10
  - [4,2,11,1] => [40,20,110,10]
  - [13] => [130]
  - [12] => [120]




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
  - [1] => [2]
  - [1,8,8] => [2,256,256]
  - [9,8,11,6,0,7] => [512,256,2048,64,1,128]
- k=3
  - [5] => [243]
  - [4,1,1,4] => [81,3,3,81]
  - [11,1,0] => [177147,3,1]
- k=4
  - [9] => [262144]
  - [3] => [64]
  - [4,8] => [256,65536]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [1] => [1]
  - [2,8,1,7] => [4,64,1,49]
  - [8,6,0,5,5,11,5] => [64,36,0,25,25,121,25]
- k=3
  - [2,9,9,9,7,3] => [8,729,729,729,343,27]
  - [] => []
  - [5,2,5,10] => [125,8,125,1000]
- k=4
  - [1,0,8,12] => [1,0,4096,20736]
  - [13,9,0] => [28561,6561,0]
  - [2,9,5,15,7,12] => [16,6561,625,50625,2401,20736]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [11,15,7,11] => [15,11,15,7,11]
  - [5,0,1,8,5] => [0,5,0,1,8,5]
  - [8,6,3,6,13,4] => [6,8,6,3,6,13,4]
- k=3
  - [5,12,6] => [6,5,12,6]
  - [16,4,13] => [13,16,4,13]
  - [6,5,1] => [1,6,5,1]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [11,4] => [2,11,4]
  - [] => [2]
  - [] => [2]
- k=3
  - [11,16,6,10,8] => [3,11,16,6,10,8]
  - [11,16,12,14,9,1,10] => [3,11,16,12,14,9,1,10]
  - [10,3,5,16,15,16,1] => [3,10,3,5,16,15,16,1]
- k=-2
  - [12,7,10,10] => [-2,12,7,10,10]
  - [13,11] => [-2,13,11]
  - [10,12,10] => [-2,10,12,10]
- k=10
  - [16,13,10,9] => [10,16,13,10,9]
  - [3,7,11,11,9] => [10,3,7,11,11,9]
  - [7,0,7,7] => [10,7,0,7,7]




### prime

`prime` returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.

Examples:
- 1 => 5
- 2 => 7
- 3 => 11
- 7 => 23




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
  - [15,9,15,6,0,1,16,0,0] => [15,15,6,0,1,16,0,0]
  - [10,0,13,16,11,14,0] => [10,13,16,11,14,0]
  - [5,6,13,11,0,2,8] => [5,13,11,0,2,8]
- k=3
  - [15,6,3,10,13,15] => [15,6,10,13,15]
  - [0,12,10] => [0,12]
  - [9,4,12,16,4,1,0] => [9,4,16,4,1,0]


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
  - [8] => []
  - [] => []
  - [2,4,11,3,3] => [11,3,3]
- k=3
  - [16,0,15,5,9] => [16,5]
  - [13] => [13]
  - [11,2,7,5,2] => [11,2,7,5,2]
- k=5
  - [2,0,10,14,10,10,10] => [2,14]
  - [15,10,25,15,20,40] => []
  - [16,6] => [16,6]


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
  - [11,11,7] => [11,11,7,11,11,7]
  - [10,3,13,1] => [10,3,13,1,10,3,13,1]
  - [14] => [14,14]
- k=3
  - [13,7,2] => [13,7,2,13,7,2,13,7,2]
  - [3,4] => [3,4,3,4,3,4]
  - [5,13] => [5,13,5,13,5,13]
- k=5
  - [4,9] => [4,9,4,9,4,9,4,9,4,9]
  - [] => []
  - [14] => [14,14,14,14,14]




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
  - [1,12] => [2,12]
  - [1,1,1,1,9] => [2,2,2,2,9]
  - [4,1] => [4,2]
- k=2, n=10
  - [10,4,8,2,2] => [10,4,8,10,10]
  - [2,2] => [10,10]
  - [2,2,6] => [10,10,6]
- k=3, n=-2
  - [12,13,8] => [12,13,8]
  - [3,3,3,14] => [-2,-2,-2,14]
  - [3,4] => [-2,4]
- k=5, n=0
  - [5,15,16,9,12] => [0,15,16,9,12]
  - [5,5] => [0,0]
  - [15,14] => [15,14]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [14,12,7,7,12,0] => [14,14,14,14,14,14]
  - [5,3,12,8,16,16,0] => [5,5,5,5,5,5,5]
  - [6,15,14,1,5,12,13,16] => [6,6,6,6,6,6,6,6]
- k=2
  - [6,16] => [16,16]
  - [11,5,3,6,10,9,13] => [5,5,5,5,5,5,5]
  - [7,6,4,0,13,14,10,12,14] => [6,6,6,6,6,6,6,6,6]
- k=3
  - [12,13,9,8,7,4,10,5,14,12] => [9,9,9,9,9,9,9,9,9,9]
  - [9,2,4,8,12,15,1,16,14] => [4,4,4,4,4,4,4,4,4]
  - [1,16,16,15,14,14,14,5,2,2] => [16,16,16,16,16,16,16,16,16,16]
- k=5
  - [2,7,13,8,7,3,6,4,14,3,10] => [7,7,7,7,7,7,7,7,7,7,7]
  - [13,8,8,1,8,5,0,9,5,15] => [8,8,8,8,8,8,8,8,8,8]
  - [10,3,16,15,12,9,14,8] => [12,12,12,12,12,12,12,12]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [8,6,16,7,11] => [2,6,16,7,11]
  - [12,5,2,5,12,0] => [2,5,2,5,12,0]
  - [11,11,7,8] => [2,11,7,8]
- k=2, n=10
  - [0,16,12,5] => [0,10,12,5]
  - [16,7,3,0] => [16,10,3,0]
  - [10,11] => [10,10]
- k=3, n=-2
  - [15,6,5,16,5,5,4,0,11] => [15,6,-2,16,5,5,4,0,11]
  - [10,10,13,14,1,3] => [10,10,-2,14,1,3]
  - [13,13,5,14,15,15,12,12,13,11] => [13,13,-2,14,15,15,12,12,13,11]
- k=5, n=0
  - [9,1,16,9,4,15,14,12,8,16] => [9,1,16,9,0,15,14,12,8,16]
  - [16,14,12,6,1,4,5,16,3,11] => [16,14,12,6,0,4,5,16,3,11]
  - [8,5,16,2,0,11,2,11] => [8,5,16,2,0,11,2,11]


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
  - [14,4,14,16,4] => [4,14,4,14,16]
  - [16,3,8] => [8,16,3]
  - [16,9,11,0] => [0,16,9,11]
- k=3
  - [13,3,6,11] => [3,6,11,13]
  - [11,11,6] => [11,11,6]
  - [11,11,14,1] => [11,14,1,11]
- k=-2
  - [6,5,14] => [14,6,5]
  - [13,2,10,0,0,16] => [10,0,0,16,13,2]
  - [14,8,13,14,6,6] => [13,14,6,6,14,8]
- k=10
  - [] => []
  - [11,3,8,2] => [8,2,11,3]
  - [5] => [5]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [5,14,5,8,16] => [14,5]
  - [12,1,14,2,12,11,13,8,2,11,3] => [1,14]
  - [2,14,15,16,3,11,2] => [14,15]
- k=2, n=3
  - [15,13,8,9,4,9,8,6,5,13] => [13,8,9]
  - [0,16,2,0,0,7,13,9,13,0,3,15] => [16,2,0]
  - [7,7,8,9,10,4,7,13,7,6] => [7,8,9]
- k=3, n=3
  - [7,3,15,9,10,10,12,3,3] => [15,9,10]
  - [7,6,12,11,4,14,15,7,13,11,7,7,3,2] => [12,11,4]
  - [7,10,1,12,5,8,11,2,6,10,7,9,2] => [1,12,5]
- k=3, n=4
  - [14,4,8,8,11,11,2,4,15,15,1,5,14,3] => [8,8,11,11]
  - [2,13,8,5,2,2,2,8,7] => [8,5,2,2]
  - [8,1,5,8,13,10,1,6,8,0] => [5,8,13,10]


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
  - [13,3,3] => [13,3]
  - [0,15,5,2,14,5,9,6] => [0,15]
  - [2,11,9,0] => [2,11]
- k=3
  - [1,12,13] => [1,12,13]
  - [0,9,7,16,6] => [0,9,7]
  - [3,12,16,16,6,3,13,13,14] => [3,12,16]
- k=5
  - [3,3,15,5,1,14,6,9] => [3,3,15,5,1]
  - [14,8,3,15,1,7,13,11] => [14,8,3,15,1]
  - [11,12,1,7,10,1] => [11,12,1,7,10]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




