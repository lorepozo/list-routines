# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [13,6,9,11,9] => [14,7,10,12,10]
  - [] => []
  - [] => []
- k=2
  - [12,6] => [14,8]
  - [4,6] => [6,8]
  - [12] => [14]
- k=3
  - [1,8,2,4] => [4,11,5,7]
  - [13,2,6,6] => [16,5,9,9]
  - [2,13,0,14,4,7,13] => [5,16,3,17,7,10,16]
- k=-2
  - [] => []
  - [9,0,2] => [7,-2,0]
  - [3,4,8,6] => [1,2,6,4]
- k=10
  - [5,11,2] => [15,21,12]
  - [14,2,15,0,11,11] => [24,12,25,10,21,21]
  - [5,7,1,2,0] => [15,17,11,12,10]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [3,4,3,5] => [3,4,3,5,4]
  - [11,2] => [11,2,2]
  - [1,0,16,3,10,9,1] => [1,0,16,3,10,9,1,0]
- k=3
  - [8,4,3,13] => [8,4,3,13,3]
  - [8,4,7,3] => [8,4,7,3,7]
  - [0,4,11,15,6,15] => [0,4,11,15,6,15,11]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [3] => [3,2]
  - [0,14,15,11,12,2] => [0,14,15,11,12,2,2]
  - [11,0,0] => [11,0,0,2]
- k=3
  - [0,12,4,11,16] => [0,12,4,11,16,3]
  - [7,1,10,16] => [7,1,10,16,3]
  - [13,14,3] => [13,14,3,3]
- k=-2
  - [7,15,16,15,7,1,0] => [7,15,16,15,7,1,0,-2]
  - [2,2,6,16,2,2] => [2,2,6,16,2,2,-2]
  - [15] => [15,-2]
- k=10
  - [] => [10]
  - [0,14,12] => [0,14,12,10]
  - [13,5,11] => [13,5,11,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [3,3] => [5,5]
  - [1,2,3,2] => [3,4,5,4]
  - [1,5,4,0,6] => [3,0,6,2,1]
- k=1, n=10
  - [1,2,9,7,5] => [2,3,0,8,6]
  - [] => []
  - [5,3,0] => [6,4,1]
- k=10, n=26
  - [0,25,14,1,22] => [10,9,24,11,6]
  - [9,1] => [19,11]
  - [22] => [6]
- k=13, n=26
  - [11,12,24,8,23,6,23] => [24,25,11,21,10,19,10]
  - [19] => [6]
  - [0,24,23,12,24,21] => [13,11,10,25,11,8]


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
  - [2,0,2,2,2,2,2] => 6
  - [13,4] => 0
  - [2,16,3,2] => 2
- k=3
  - [3,3] => 2
  - [8,9,3,5,3,13,15] => 2
  - [6,5,7] => 0
- k=10
  - [0,12,4,10,11,0,12] => 1
  - [10,10,10] => 3
  - [9,14,14,8,8] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [6,4,16,15,9,1] => [16,15,9,1]
  - [0,12,14,4,5,9] => [14,4,5,9]
  - [9,9,15,9,15,7,16,9,8] => [15,9,15,7,16,9,8]
- k=3
  - [11,0,15,5,8,12] => [5,8,12]
  - [15,3,13,10,16] => [10,16]
  - [16,16,4,7] => [7]
- k=5
  - [7,7,11,6,2,15,8,11] => [15,8,11]
  - [9,10,11,0,11,10,8] => [10,8]
  - [11,13,8,5,11,0,1,9,3,6,10] => [0,1,9,3,6,10]




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
  - [7] => false
  - [2,2,2,2,2,9] => true
  - [2,10,10] => true
- k=3
  - [2,8,3,13,15,4] => true
  - [16,0,3,3] => true
  - [] => false
- k=10
  - [10] => true
  - [10,7,15,10,10] => true
  - [] => false




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
  - [3,3] => [1,1]
  - [4,4,4,4,4,4,4] => [1,1,1,1,1,1,1]
  - [13,-1,-1,8,2] => [1,0,0,1,1]
- k=3
  - [12,4,8,3] => [1,1,1,1]
  - [0,0,0] => [0,0,0]
  - [0] => [0]
- k=7
  - [] => []
  - [10,10] => [1,1]
  - [11,5,5,5] => [1,0,0,0]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [12,10,10,9,16] => [1,1,1,0,1]
  - [2,1] => [1,0]
  - [] => []
- k=3
  - [13,2,7,11,5,15] => [0,0,0,0,0,1]
  - [3,1,14,11] => [1,0,0,0]
  - [8] => [0]
- k=7
  - [10,7,7,7,7] => [0,1,1,1,1]
  - [0] => [1]
  - [1,16,8,10] => [0,0,0,0]




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
  - [11,3,10,10,12,2] => [0,0,0,0,0,0]
  - [1,1,1,1,1,1] => [1,1,1,1,1,1]
  - [] => []
- k=2
  - [2] => [1]
  - [2,2] => [1,1]
  - [2,12,2,2,2,13,2] => [1,0,1,1,1,0,1]
- k=3
  - [10,3,3,6,3,3] => [0,1,1,0,1,1]
  - [9,0,9,4,13,16] => [0,0,0,0,0,0]
  - [16,16,5,6,2,15] => [0,0,0,0,0,0]
- k=-2
  - [9,9,1,13,7] => [0,0,0,0,0]
  - [-2,-2,-2,-2,-2,-2] => [1,1,1,1,1,1]
  - [10,3,2,4,6,9] => [0,0,0,0,0,0]
- k=10
  - [10,3,10,15,16,4] => [1,0,1,0,0,0]
  - [5] => [0]
  - [] => []




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
  - [3,9,14,6,16,0,13] => 9
  - [8,3,12,16,10] => 3
  - [1,1,6,5,16,2,3] => 1
- k=3
  - [7,5,4,13,7,15] => 4
  - [2,11,3] => 3
  - [14,8,4,15,2,0,16] => 4


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [6] => [6]
  - [] => []
- k=10
  - [6,10,5,6] => [6,10,10,10,5,10,6]
  - [7] => [7]
  - [1,2] => [1,10,2]
- k=-2
  - [6,9,6] => [6,-2,9,-2,6]
  - [5] => [5]
  - [6,1,4,9,1,14,5] => [6,-2,1,-2,4,-2,9,-2,1,-2,14,-2,5]
- k=0
  - [13,4,10,11,1,7,8] => [13,0,4,0,10,0,11,0,1,0,7,0,8]
  - [12,13,15,9,10,7] => [12,0,13,0,15,0,9,0,10,0,7]
  - [9,8,15,14,16,10,6] => [9,0,8,0,15,0,14,0,16,0,10,0,6]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [5,14,4,10,15,13] => false
  - [8,22,4,18,16,10,30] => true
  - [] => true
- k=3
  - [4,10,16,7,6] => false
  - [4,4] => false
  - [33,27,42,21,12,45,15] => true
- k=5
  - [12,11,3,14] => false
  - [50] => true
  - [40,40] => true


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
  - [11,0,4] => [0,4]
  - [4,4,14,10,7,2,4] => [4,4,14,10,2,4]
  - [1,8,10,9,0,1,7] => [8,10,0]
- k=3
  - [10,4,15,13] => [15]
  - [16,9,9,27] => [9,9,27]
  - [13,16,2] => []
- k=5
  - [16,5,9] => [5]
  - [2,12,9,13] => []
  - [6,9,4] => []


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [3,6,13,11,16,6,8,1,1] => 13
  - [13,4,0,10,10,0,0,13] => 13
  - [8,3,4,0] => 4
- k=3
  - [11,7,5,13,8,6,13,13] => 13
  - [1,12,1,12,0,4,2] => 4
  - [0,1,6,13,8,14,9,2] => 9


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [5,16,1,9,14,7] => 5
  - [15,16,12,11,1,12] => 11
  - [8,6,12,9,10,1] => 6
- k=3
  - [14,14,2,12,3,12,11,9,13] => 9
  - [15,10,9,13,6,8,6] => 8
  - [10,9,12,9] => 10


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
  - [9,11,4,16,11,12,6] => [1,1,0,0,1,0,0]
  - [3,4,7] => [1,0,1]
  - [15] => [1]
- k=3
  - [16,9] => [1,0]
  - [6,1,15,0,1,10,11] => [0,1,0,0,1,1,2]
  - [3,4,8,9,12,8,10] => [0,1,2,0,0,2,1]
- k=10
  - [7,9,13] => [7,9,3]
  - [4,6,13,8] => [4,6,3,8]
  - [2,11,12,8] => [2,1,2,8]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [12,9,13,13,16,12,3] => [24,18,26,26,32,24,6]
  - [14,16,3,16] => [28,32,6,32]
  - [8,3,2] => [16,6,4]
- k=3
  - [10,8,15,0,8] => [30,24,45,0,24]
  - [7,11,15] => [21,33,45]
  - [10,5,13,13,11] => [30,15,39,39,33]
- k=-2
  - [8,2] => [-16,-4]
  - [] => []
  - [8,1,7,0,11] => [-16,-2,-14,0,-22]
- k=10
  - [5,4,7,7,6] => [50,40,70,70,60]
  - [0,11,11,15] => [0,110,110,150]
  - [4,14,10,12,15] => [40,140,100,120,150]




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
  - [9] => [512]
  - [11] => [2048]
  - [8,2,8,7,6,8,4] => [256,4,256,128,64,256,16]
- k=3
  - [] => []
  - [11,10,7,6,3,0] => [177147,59049,2187,729,27,1]
  - [5] => [243]
- k=4
  - [10,8,2,6,9,8,1] => [1048576,65536,16,4096,262144,65536,4]
  - [4,1,10,2] => [256,4,1048576,16]
  - [2,2,7,3,10] => [16,16,16384,64,1048576]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [16,7,8,7,11] => [256,49,64,49,121]
  - [0,2] => [0,4]
  - [5,10,10,11] => [25,100,100,121]
- k=3
  - [] => []
  - [9,0,3] => [729,0,27]
  - [10,8,3,6] => [1000,512,27,216]
- k=4
  - [0,2,12] => [0,16,20736]
  - [0] => [0]
  - [] => []


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [7,8,4,10,2,12,12,12] => [8,7,8,4,10,2,12,12,12]
  - [8,8,1] => [8,8,8,1]
  - [4,1,3,11,15,2,11] => [1,4,1,3,11,15,2,11]
- k=3
  - [6,9,14,11] => [14,6,9,14,11]
  - [12,13,4,6,1,11] => [4,12,13,4,6,1,11]
  - [16,3,6,6,12,5,3] => [6,16,3,6,6,12,5,3]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [11,14] => [2,11,14]
  - [9] => [2,9]
  - [7,15,8,8,4,2,6] => [2,7,15,8,8,4,2,6]
- k=3
  - [6,10,7,14] => [3,6,10,7,14]
  - [8,10,8] => [3,8,10,8]
  - [2,13,14,3,3,8] => [3,2,13,14,3,3,8]
- k=-2
  - [11,9,11,4,6,10,8] => [-2,11,9,11,4,6,10,8]
  - [5,13] => [-2,5,13]
  - [9,7,5,8,3,5] => [-2,9,7,5,8,3,5]
- k=10
  - [13] => [10,13]
  - [8] => [10,8]
  - [] => [10]




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
  - [8,9] => [8]
  - [6,11,15,16,11,6,16,12,4] => [6,15,16,11,6,16,12,4]
  - [11,0,4,16,4,6,10] => [11,4,16,4,6,10]
- k=3
  - [16,7,6,11,1,4,11,13,8,9] => [16,7,11,1,4,11,13,8,9]
  - [1,8,13,3] => [1,8,3]
  - [4,14,13,16,11,6,4] => [4,14,16,11,6,4]


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
  - [14] => []
  - [] => []
  - [15,9,6,15,13,5,3] => [15,9,15,13,5,3]
- k=3
  - [24,18,10,13,12,3] => [10,13]
  - [9,9] => []
  - [14,5,8,3,15,4,7] => [14,5,8,4,7]
- k=5
  - [40,20,11,10,0,30,9] => [11,9]
  - [16,4,12,45] => [16,4,12]
  - [7,11,45,5] => [7,11]


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
  - [1,7,10] => [1,7,10,1,7,10]
  - [12,1,12,3,14] => [12,1,12,3,14,12,1,12,3,14]
  - [15,12,12,6,14] => [15,12,12,6,14,15,12,12,6,14]
- k=3
  - [] => []
  - [1] => [1,1,1]
  - [11,12,6,8] => [11,12,6,8,11,12,6,8,11,12,6,8]
- k=5
  - [] => []
  - [3] => [3,3,3,3,3]
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
  - [1,1,1,1,12] => [2,2,2,2,12]
  - [4,10] => [4,10]
  - [15,15,1,4,7,13] => [15,15,2,4,7,13]
- k=2, n=10
  - [11,2,2] => [11,10,10]
  - [12,2,2,2,2,2] => [12,10,10,10,10,10]
  - [10,12,2] => [10,12,10]
- k=3, n=-2
  - [3,3,2,3,3] => [-2,-2,2,-2,-2]
  - [11,16,3] => [11,16,-2]
  - [16,15,15,12] => [16,15,15,12]
- k=5, n=0
  - [11,3,3,5,9,10] => [11,3,3,0,9,10]
  - [16,3] => [16,3]
  - [5,5,5] => [0,0,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [9,15,10,8,15] => [9,9,9,9,9]
  - [13,8,2,11,16] => [13,13,13,13,13]
  - [6,16,6,10,9] => [6,6,6,6,6]
- k=2
  - [9,15,3] => [15,15,15]
  - [9,13,5,11,6,8,14,15,16] => [13,13,13,13,13,13,13,13,13]
  - [12,6,13,5,15,5,3] => [6,6,6,6,6,6,6]
- k=3
  - [6,10,2] => [2,2,2]
  - [3,1,12,8,2] => [12,12,12,12,12]
  - [16,1,9] => [9,9,9]
- k=5
  - [13,13,0,13,14,2,6,1,6,5,12,5] => [14,14,14,14,14,14,14,14,14,14,14,14]
  - [11,6,15,1,2,2,13,6,0,10,3] => [2,2,2,2,2,2,2,2,2,2,2]
  - [16,14,6,14,12] => [12,12,12,12,12]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [3,16,14,16,9,11,16] => [2,16,14,16,9,11,16]
  - [4,2,16,14,12,1] => [2,2,16,14,12,1]
  - [1,4,12,9,16,11,7] => [2,4,12,9,16,11,7]
- k=2, n=10
  - [11,11,2,12] => [11,10,2,12]
  - [1,12,9,3,2,11,1,9] => [1,10,9,3,2,11,1,9]
  - [13,8] => [13,10]
- k=3, n=-2
  - [4,3,0] => [4,3,-2]
  - [14,15,10,7,10] => [14,15,-2,7,10]
  - [8,1,8,9] => [8,1,-2,9]
- k=5, n=0
  - [8,11,13,16,6,14,13,12,1,6] => [8,11,13,16,0,14,13,12,1,6]
  - [11,13,5,12,10,10,2,0] => [11,13,5,12,0,10,2,0]
  - [7,13,13,6,11,5,3,1,5] => [7,13,13,6,0,5,3,1,5]


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
  - [9,2,3,16,10,15,5] => [5,9,2,3,16,10,15]
  - [] => []
  - [8] => [8]
- k=3
  - [14,9] => [9,14]
  - [5,13] => [13,5]
  - [] => []
- k=-2
  - [10] => [10]
  - [16,1,14,12] => [14,12,16,1]
  - [12,16,5,0,9] => [5,0,9,12,16]
- k=10
  - [4] => [4]
  - [14] => [14]
  - [] => []




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [2,16,1,11,8,5] => [16,1]
  - [1,14,6,15,7,3,10,9,9,8,1,9] => [14,6]
  - [16,8,13,4,15,5,2,6,7] => [8,13]
- k=2, n=3
  - [10,4,0,1,14,2,8,1] => [4,0,1]
  - [9,12,4,13,10,14,15,13,7,9,2,1,15] => [12,4,13]
  - [10,5,3,16,16,3,11,2] => [5,3,16]
- k=3, n=3
  - [9,14,13,13,15,2,1] => [13,13,15]
  - [4,2,3,13,1,3,16,7,1] => [3,13,1]
  - [7,16,8,16,14,5,12,9,5,3,16] => [8,16,14]
- k=3, n=4
  - [6,2,11,16,4,10,12,5,2] => [11,16,4,10]
  - [1,8,16,14,14,15,16,13,8,12,5] => [16,14,14,15]
  - [0,15,2,7,10,12,10,4,12,15,1] => [2,7,10,12]


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
  - [5,4,11,15] => [5,4]
  - [9,9,12,6,12,1,9,8,16] => [9,9]
  - [7,6,5,14,13,7,1,14] => [7,6]
- k=3
  - [15,9,13,15,1,16] => [15,9,13]
  - [13,16,4,12] => [13,16,4]
  - [8,0,4,6,7,4] => [8,0,4]
- k=5
  - [16,5,3,13,11,12,11,4,14,13] => [16,5,3,13,11]
  - [4,2,2,15,13,0,4] => [4,2,2,15,13]
  - [16,2,10,6,8,4,15,15,12,16,13,7] => [16,2,10,6,8]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




