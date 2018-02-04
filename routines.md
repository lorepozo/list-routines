# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [14,2] => [15,3]
  - [10,2,4,16,16] => [11,3,5,17,17]
  - [11,16,8,5,1,11,6] => [12,17,9,6,2,12,7]
- k=2
  - [2] => [4]
  - [9,4] => [11,6]
  - [15,5,9,0,6] => [17,7,11,2,8]
- k=3
  - [14,5,0,3,0,16] => [17,8,3,6,3,19]
  - [7] => [10]
  - [4,7,6] => [7,10,9]
- k=-2
  - [10,13,5] => [8,11,3]
  - [13,15,7] => [11,13,5]
  - [10,12,3,4,0,13] => [8,10,1,2,-2,11]
- k=10
  - [] => []
  - [2] => [12]
  - [12] => [22]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [1,1] => [1,1,1]
  - [8,3] => [8,3,3]
  - [8,10,7] => [8,10,7,10]
- k=3
  - [4,1,10,14,1,9,14,8] => [4,1,10,14,1,9,14,8,10]
  - [8,16,10,16,10,3,12,10,1,6] => [8,16,10,16,10,3,12,10,1,6,10]
  - [2,10,16,4,12,5] => [2,10,16,4,12,5,16]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [6] => [6,2]
  - [] => [2]
  - [3,9,16,7] => [3,9,16,7,2]
- k=3
  - [15,8,8,12,13,15] => [15,8,8,12,13,15,3]
  - [6,8] => [6,8,3]
  - [3,5] => [3,5,3]
- k=-2
  - [5,13] => [5,13,-2]
  - [9] => [9,-2]
  - [13,5,9] => [13,5,9,-2]
- k=10
  - [16] => [16,10]
  - [1,9,12,9,15,4] => [1,9,12,9,15,4,10]
  - [1,4,3,5,0] => [1,4,3,5,0,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [] => []
  - [3,0,3,0,6,0,2] => [5,2,5,2,1,2,4]
  - [1,1] => [3,3]
- k=1, n=10
  - [5,8,3,8,5,6] => [6,9,4,9,6,7]
  - [7,4,5,9,7] => [8,5,6,0,8]
  - [6,5,9,9,4] => [7,6,0,0,5]
- k=10, n=26
  - [] => []
  - [19,12,24,3] => [3,22,8,13]
  - [21,4] => [5,14]
- k=13, n=26
  - [20,8,12,15,25,21] => [7,21,25,2,12,8]
  - [] => []
  - [1,13,14] => [14,0,1]


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
  - [] => 0
  - [2,3,2,2] => 3
  - [5,8,15,15] => 0
- k=3
  - [7,6,16,3] => 1
  - [] => 0
  - [3,3,3,10,3,3,3] => 6
- k=10
  - [10,13,11,4,8,10,9] => 2
  - [6,10,10,8,6,0] => 2
  - [10] => 1




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [4,3] => []
  - [14,3,12,10,1,9,7] => [12,10,1,9,7]
  - [7,11,14,0,16,0,2,4] => [14,0,16,0,2,4]
- k=3
  - [11,6,10] => []
  - [7,1,0,5,6,15] => [5,6,15]
  - [7,3,14,6,9,8,8,7,9,5] => [6,9,8,8,7,9,5]
- k=5
  - [3,5,5,12,6] => []
  - [16,16,0,1,15,2,1,0,6,11,8,14] => [2,1,0,6,11,8,14]
  - [12,0,6,1,13,11,12] => [11,12]




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
  - [16] => false
  - [1,2,7,6,10] => true
  - [2,2,2,2,2,2] => true
- k=3
  - [10,2] => false
  - [14,1,6,13,6,12,3] => true
  - [11] => false
- k=10
  - [15,11,9,7] => false
  - [9,8,5] => false
  - [0,0,9] => false




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
  - [9,5,6,15,1,1] => [1,1,1,1,0,0]
  - [] => []
  - [8,14,8,14] => [1,1,1,1]
- k=3
  - [0,10,0,13,15] => [0,1,0,1,1]
  - [3,3,3,14,3] => [1,1,1,1,1]
  - [5,13,1,0,7] => [1,1,0,0,1]
- k=7
  - [10,10,10] => [1,1,1]
  - [6,3,13] => [0,0,1]
  - [3] => [0]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [10,4,6,5] => [1,1,1,0]
  - [7,9,13,9,12,1] => [0,0,0,0,1,0]
  - [] => []
- k=3
  - [7,4,6,8] => [0,0,1,0]
  - [] => []
  - [5,0,1,3,8] => [0,1,0,1,0]
- k=7
  - [7] => [1]
  - [2,7] => [0,1]
  - [11,3,5,6,2,14,0] => [0,0,0,0,0,1,1]




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
  - [] => []
  - [1] => [1]
  - [5] => [0]
- k=2
  - [11,0,2,2] => [0,0,1,1]
  - [2,12,2,2] => [1,0,1,1]
  - [2,2,2,2] => [1,1,1,1]
- k=3
  - [2] => [0]
  - [13,7,13,3,11,5,4] => [0,0,0,1,0,0,0]
  - [3,3,7,3] => [1,1,0,1]
- k=-2
  - [10] => [0]
  - [9,3,10,8] => [0,0,0,0]
  - [11,-2] => [0,1]
- k=10
  - [10] => [1]
  - [] => []
  - [5,2,11,2,15] => [0,0,0,0,0]




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
  - [0,16] => 16
  - [11,15] => 15
  - [2,2,12,14] => 2
- k=3
  - [1,2,2,9,7,7,11,10,6] => 2
  - [0,16,5,6] => 5
  - [14,8,2,0] => 2


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [10,9,0] => [10,1,9,1,0]
  - [16,5,12,14] => [16,1,5,1,12,1,14]
  - [1,7] => [1,1,7]
- k=10
  - [12,6] => [12,10,6]
  - [2,16,2,7] => [2,10,16,10,2,10,7]
  - [10,12,15,14,5] => [10,10,12,10,15,10,14,10,5]
- k=-2
  - [] => []
  - [13,10] => [13,-2,10]
  - [8,15,1] => [8,-2,15,-2,1]
- k=0
  - [3,11,7,6,2] => [3,0,11,0,7,0,6,0,2]
  - [4,12,5] => [4,0,12,0,5]
  - [5,11] => [5,0,11]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [6,20] => true
  - [12] => true
  - [8,16,1,4,7,14,2] => false
- k=3
  - [0,15,21,48,15] => true
  - [13,5,6,12,15] => false
  - [30] => true
- k=5
  - [5,1,15,4] => false
  - [11,10,4,13,8] => false
  - [] => true


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
  - [2,4,14,2,11,13] => [2,4,14,2]
  - [13,3,15,4] => [4]
  - [] => []
- k=3
  - [1,0] => [0]
  - [] => []
  - [11,14,5,0] => [0]
- k=5
  - [13,15,13,6,5,15] => [15,5,15]
  - [15,13,11,0] => [15,0]
  - [30] => [30]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [5,14,9,2] => 9
  - [4,1,4,3] => 4
  - [7,16,4,7,13,10,11,8] => 13
- k=3
  - [7,13,11,7,16,8,12,16,12] => 13
  - [10,2,10] => 2
  - [14,4,8,13,1,0,10,5,11] => 11


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [0,0,5,1,15,0] => 0
  - [0,4,13] => 4
  - [0,3,8] => 3
- k=3
  - [8,2,2,16,1] => 2
  - [4,8,7,14,6,8] => 7
  - [12,9,3,4,5,3,15,12,4,9] => 4


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
  - [7,4,1] => [1,0,1]
  - [15,16,9,14,14,11,15] => [1,0,1,0,0,1,1]
  - [3,5,8,2,16,12] => [1,1,0,0,0,0]
- k=3
  - [0,15,13,3,14,3] => [0,0,1,0,2,0]
  - [] => []
  - [2,13,12,3] => [2,1,0,0]
- k=10
  - [12,13,9,14,2] => [2,3,9,4,2]
  - [12,7,11,4,3] => [2,7,1,4,3]
  - [3,13,10,7,5,16,11] => [3,3,0,7,5,6,1]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [] => []
  - [0,15,0] => [0,30,0]
  - [7,6,11,3,8,10,12] => [14,12,22,6,16,20,24]
- k=3
  - [12,11,0,8,8,7] => [36,33,0,24,24,21]
  - [16,1,9,7,6,12] => [48,3,27,21,18,36]
  - [6,12,1,13,16] => [18,36,3,39,48]
- k=-2
  - [3] => [-6]
  - [10] => [-20]
  - [10,7,3] => [-20,-14,-6]
- k=10
  - [9] => [90]
  - [14,11,15,2,5,14,0] => [140,110,150,20,50,140,0]
  - [3,2] => [30,20]




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
  - [1,11,1] => [2,2048,2]
  - [5,9,8,2,6] => [32,512,256,4,64]
- k=3
  - [] => []
  - [9,6,3,4,9] => [19683,729,27,81,19683]
  - [5,0,9] => [243,1,19683]
- k=4
  - [] => []
  - [10,0,7,2,6,9,10] => [1048576,1,16384,16,4096,262144,1048576]
  - [6,5] => [4096,1024]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [12,9,15,9] => [144,81,225,81]
  - [6,15,6,1,10] => [36,225,36,1,100]
  - [5] => [25]
- k=3
  - [8,14,16,7,6] => [512,2744,4096,343,216]
  - [8,7,14,6,14,4] => [512,343,2744,216,2744,64]
  - [10,7] => [1000,343]
- k=4
  - [13,10] => [28561,10000]
  - [0,13] => [0,28561]
  - [13,7,2,12,9] => [28561,2401,16,20736,6561]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [9,5,12] => [5,9,5,12]
  - [7,0,1,0,5] => [0,7,0,1,0,5]
  - [13,10,7,7,3] => [10,13,10,7,7,3]
- k=3
  - [13,4,12,0,3,2] => [12,13,4,12,0,3,2]
  - [7,13,3,14,1,0,14,12] => [3,7,13,3,14,1,0,14,12]
  - [13,15,14,3,14,5,7] => [14,13,15,14,3,14,5,7]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [10,2,4] => [2,10,2,4]
  - [9,3] => [2,9,3]
  - [12,12,9] => [2,12,12,9]
- k=3
  - [1,3] => [3,1,3]
  - [15,9,8,0,10] => [3,15,9,8,0,10]
  - [6,8] => [3,6,8]
- k=-2
  - [11,11,14,12,0,9,8] => [-2,11,11,14,12,0,9,8]
  - [] => [-2]
  - [16,6,3,9,14,3] => [-2,16,6,3,9,14,3]
- k=10
  - [12,9,8] => [10,12,9,8]
  - [1,14,9,12,10] => [10,1,14,9,12,10]
  - [14,15,11,1,3,15,5] => [10,14,15,11,1,3,15,5]




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
  - [1,0,1,5,10,0] => [1,1,5,10,0]
  - [4,9,6,7,16,16,8,13] => [4,6,7,16,16,8,13]
  - [5,4,4,1,6,12] => [5,4,1,6,12]
- k=3
  - [7,5,16,16,6,15,10,14] => [7,5,16,6,15,10,14]
  - [0,12,9] => [0,12]
  - [8,4,9,13,2] => [8,4,13,2]


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
  - [] => []
  - [15,12,1,14,6,14] => [15,1]
  - [12,14] => []
- k=3
  - [3,4] => [4]
  - [7,10,27,8,10] => [7,10,8,10]
  - [13,7,8,7,11,0,14] => [13,7,8,7,11,14]
- k=5
  - [7,1,4,7,6,15] => [7,1,4,7,6]
  - [5,4,9,15,16,4,16] => [4,9,16,4,16]
  - [15,13] => [13]


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
  - [0,4,14,6,2] => [0,4,14,6,2,0,4,14,6,2]
  - [9,7,4,8] => [9,7,4,8,9,7,4,8]
  - [16,9] => [16,9,16,9]
- k=3
  - [6,15] => [6,15,6,15,6,15]
  - [1] => [1,1,1]
  - [10,0,16,13,14] => [10,0,16,13,14,10,0,16,13,14,10,0,16,13,14]
- k=5
  - [11,9,1,7] => [11,9,1,7,11,9,1,7,11,9,1,7,11,9,1,7,11,9,1,7]
  - [0,3,4,10,13] => [0,3,4,10,13,0,3,4,10,13,0,3,4,10,13,0,3,4,10,13,0,3,4,10,13]
  - [5,10] => [5,10,5,10,5,10,5,10,5,10]




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
  - [11,6,8,7,1,1,15] => [11,6,8,7,2,2,15]
  - [1,1,1,1,1,1,1] => [2,2,2,2,2,2,2]
  - [15,6,3,4,15] => [15,6,3,4,15]
- k=2, n=10
  - [] => []
  - [2,4] => [10,4]
  - [2,2] => [10,10]
- k=3, n=-2
  - [3] => [-2]
  - [3,16,3] => [-2,16,-2]
  - [3,11,2,3,7,13] => [-2,11,2,-2,7,13]
- k=5, n=0
  - [2,5,12,10,1,7,10] => [2,0,12,10,1,7,10]
  - [1,5,16,6,0] => [1,0,16,6,0]
  - [6,14,4,5,0,0,10] => [6,14,4,0,0,0,10]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [4,3,12,4,12,11,7] => [4,4,4,4,4,4,4]
  - [5,12,1,0,0] => [5,5,5,5,5]
  - [11,3,6,15,14] => [11,11,11,11,11]
- k=2
  - [0,8,4,7,7,1,5] => [8,8,8,8,8,8,8]
  - [0,13,7,10,10] => [13,13,13,13,13]
  - [14,8,7,0,8,1] => [8,8,8,8,8,8]
- k=3
  - [16,0,1] => [1,1,1]
  - [14,11,14,2,11,7] => [14,14,14,14,14,14]
  - [15,3,1,5,6,7] => [1,1,1,1,1,1]
- k=5
  - [16,0,6,16,6,4,9,14,9,0,16] => [6,6,6,6,6,6,6,6,6,6,6]
  - [13,8,9,11,9,16,13,2,12] => [9,9,9,9,9,9,9,9,9]
  - [9,3,1,5,10,11,15,15,12,11] => [10,10,10,10,10,10,10,10,10,10]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [11,7,4,8,11,13,9,5] => [2,7,4,8,11,13,9,5]
  - [12,11] => [2,11]
  - [4,9,2,15,9] => [2,9,2,15,9]
- k=2, n=10
  - [11,14,6,4,15,8] => [11,10,6,4,15,8]
  - [8,13,10,7,7,0] => [8,10,10,7,7,0]
  - [7,9,12,16,15,3,9,3] => [7,10,12,16,15,3,9,3]
- k=3, n=-2
  - [1,8,6,0,0,12] => [1,8,-2,0,0,12]
  - [5,3,5,4,13,4] => [5,3,-2,4,13,4]
  - [5,1,11,14,0,12,13,5,4] => [5,1,-2,14,0,12,13,5,4]
- k=5, n=0
  - [8,5,16,15,9,4,10,2,15,9,4,16] => [8,5,16,15,0,4,10,2,15,9,4,16]
  - [15,13,9,10,15,13,3,13,8,5,2,15] => [15,13,9,10,0,13,3,13,8,5,2,15]
  - [15,9,15,5,0,7,13] => [15,9,15,5,0,7,13]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### replace-k-with-n (parametric)

`replace-k-with-n` returns `n` if supplied `k`, otherwise returns the given number.

Examples:
- k=1, n=2
  - 11 => 11
  - 2 => 2
  - 1 => 2
- k=2, n=10
  - 2 => 10
  - 14 => 14
  - 6 => 6
- k=3, n=-2
  - 3 => -2
  - 13 => 13
  - 5 => 5
- k=5, n=0
  - 5 => 0
  - 11 => 11
  - 0 => 0




### reverse

`reverse` reverses the list.

Examples:
- [2,0,4] => [4,0,2]
- [2,5,4,2,0,5,1,1] => [1,1,5,0,2,4,5,2]




### rotate-k (parametric)

`rotate-k` shifts number placements forward by `k` (shifts backward if `k` is negative).

Examples:
- k=1
  - [9] => [9]
  - [1,4,16,3,15] => [15,1,4,16,3]
  - [16,8,0,1] => [1,16,8,0]
- k=3
  - [7,6,14,10,2] => [14,10,2,7,6]
  - [1,10,13,12] => [10,13,12,1]
  - [14,3,7,16,16] => [7,16,16,14,3]
- k=-2
  - [15,1,1,12,7] => [1,12,7,15,1]
  - [14] => [14]
  - [3,10,3,1] => [3,1,3,10]
- k=10
  - [0,3,15,10,3] => [0,3,15,10,3]
  - [15] => [15]
  - [0,12,0,15,5,12] => [0,15,5,12,0,12]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [4,8,0,3,14,15,1,8] => [8,0]
  - [1,4,13,8,2,15] => [4,13]
  - [9,3,15,6,15] => [3,15]
- k=2, n=3
  - [9,2,8,16,14,15,6,4] => [2,8,16]
  - [6,9,10,10,6,10,4,8,3,4] => [9,10,10]
  - [7,13,11,4,5,14,12] => [13,11,4]
- k=3, n=3
  - [6,12,16,16,5,11,2] => [16,16,5]
  - [2,13,0,9,8,7,10,2,12,6,16,7] => [0,9,8]
  - [13,2,7,1,5,15,11,13,12,13,6,4,14] => [7,1,5]
- k=3, n=4
  - [2,3,9,9,14,5,15,12,15] => [9,9,14,5]
  - [1,0,0,12,0,13,3,11,0,12,13,12,12] => [0,12,0,13]
  - [12,9,5,8,15,4,13,11,7,3] => [5,8,15,4]


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
  - [10,3,6,1,1] => [10,3]
  - [16,16,10,11,3,13,9,14,14] => [16,16]
  - [14,14,2,16,10] => [14,14]
- k=3
  - [3,6,11,15,15,4,4] => [3,6,11]
  - [8,4,11,16,2,10,8,3,14,12] => [8,4,11]
  - [11,16,5,3,16] => [11,16,5]
- k=5
  - [14,1,7,16,9,1] => [14,1,7,16,9]
  - [7,7,3,0,7,4,9,10,9,10,8,13] => [7,7,3,0,7]
  - [4,2,15,7,12,14,8,3] => [4,2,15,7,12]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




