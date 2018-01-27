# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [15,16,11,8,2,11] => [16,17,12,9,3,12]
  - [3,13,9,4] => [4,14,10,5]
  - [11,14,4,3,0,5] => [12,15,5,4,1,6]
- k=2
  - [9,1,10] => [11,3,12]
  - [13,15,0,15] => [15,17,2,17]
  - [9,3,5,1] => [11,5,7,3]
- k=3
  - [] => []
  - [12,2,15,14,5] => [15,5,18,17,8]
  - [5,13,15,9] => [8,16,18,12]
- k=-2
  - [4,1,10,1,9,10,3] => [2,-1,8,-1,7,8,1]
  - [] => []
  - [12,13,3,7,12,6] => [10,11,1,5,10,4]
- k=10
  - [5,5,15,9] => [15,15,25,19]
  - [15,4] => [25,14]
  - [15,6,1,14] => [25,16,11,24]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [12,6,8,2,14,7,8] => [12,6,8,2,14,7,8,6]
  - [12,11,8,15,1,9,5,14] => [12,11,8,15,1,9,5,14,11]
  - [4,7] => [4,7,7]
- k=3
  - [12,6,3,6,0] => [12,6,3,6,0,3]
  - [7,1,9,2,8] => [7,1,9,2,8,9]
  - [10,16,2,0,3,14,9] => [10,16,2,0,3,14,9,2]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,8,11,3] => [5,8,11,3,2]
  - [] => [2]
  - [13,11] => [13,11,2]
- k=3
  - [15,16,10,5,10] => [15,16,10,5,10,3]
  - [8,10,1,1,13,11,12] => [8,10,1,1,13,11,12,3]
  - [] => [3]
- k=-2
  - [16] => [16,-2]
  - [0,7,2] => [0,7,2,-2]
  - [16,4,1,12,10,13] => [16,4,1,12,10,13,-2]
- k=10
  - [] => [10]
  - [] => [10]
  - [14,16,15,10,11] => [14,16,15,10,11,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [0,4,3,5] => [2,6,5,0]
  - [2,1,2] => [4,3,4]
  - [0] => [2]
- k=1, n=10
  - [6,9,1,2] => [7,0,2,3]
  - [7,5,5,2] => [8,6,6,3]
  - [8,6,8,4,6,6,6] => [9,7,9,5,7,7,7]
- k=10, n=26
  - [13,13,23,15,0] => [23,23,7,25,10]
  - [] => []
  - [] => []
- k=13, n=26
  - [14] => [1]
  - [11,3,5,6,20,0] => [24,16,18,19,7,13]
  - [] => []


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
  - [11,2] => 1
  - [5] => 0
- k=3
  - [3,8,3] => 2
  - [4,13] => 0
  - [3] => 1
- k=10
  - [4,10] => 1
  - [10,11,5,7,6] => 1
  - [] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [11,5,2,14] => [2,14]
  - [6,12,1] => [1]
  - [1,9,1,5,7,15] => [1,5,7,15]
- k=3
  - [4,9,4,15] => [15]
  - [11,4,16,1,10,12,13,14,4,12] => [1,10,12,13,14,4,12]
  - [2,2,0,5,8,16,4,9] => [5,8,16,4,9]
- k=5
  - [2,13,11,12,15,15,16,11,13,11] => [15,16,11,13,11]
  - [9,7,1,5,4,8] => [8]
  - [15,13,7,13,15,10,7,16,13] => [10,7,16,13]




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
  - [] => false
  - [15,5,8,15] => false
  - [6,7,9,2,5] => true
- k=3
  - [1,12] => false
  - [15,5,3,4,10,13,6] => true
  - [] => false
- k=10
  - [6,8,4,12,10,12,7] => true
  - [1,15] => false
  - [10,15] => true




### head

`head` gets the first element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [5,12,15,4,13] => [0,1,0,1,0]
  - [10,6,13,2,0,0,4] => [1,1,0,1,1,1,1]
  - [5,0,2,8] => [0,1,1,1]
- k=3
  - [3,3] => [1,1]
  - [8,13,3] => [0,0,1]
  - [4] => [0]
- k=7
  - [12,1,7,5,15] => [0,0,1,0,0]
  - [15,7,1] => [0,1,0]
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
  - [2,1,8,1,1,1] => [0,1,0,1,1,1]
  - [12,1,1,1,5] => [0,1,1,1,0]
  - [12,13,2,11,15] => [0,0,0,0,0]
- k=2
  - [] => []
  - [2,1,4,13,2] => [1,0,0,0,1]
  - [2,2,0] => [1,1,0]
- k=3
  - [5,9,9,1,3,3] => [0,0,0,0,1,1]
  - [12,3] => [0,1]
  - [] => []
- k=-2
  - [] => []
  - [9,10,0,10,10,14] => [0,0,0,0,0,0]
  - [-2,-2,9,16] => [1,1,0,0]
- k=10
  - [9,9] => [0,0]
  - [10,10,10,11,10,10,10] => [1,1,1,0,1,1,1]
  - [10] => [1]




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
  - [1,9,13,6,15,1] => 9
  - [3,4,4] => 4
  - [12,16,14,5,3,7,5,10,1] => 16
- k=3
  - [3,4,16,7,8,6,16,0] => 16
  - [12,12,14,8,15] => 14
  - [4,7,10,15,14,1,0] => 10


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [15,8,9,7] => [15,1,8,1,9,1,7]
  - [11,1] => [11,1,1]
- k=10
  - [15,10,13,16,9] => [15,10,10,10,13,10,16,10,9]
  - [12,1,13,8,9,6,3] => [12,10,1,10,13,10,8,10,9,10,6,10,3]
  - [5,2,3,8,9] => [5,10,2,10,3,10,8,10,9]
- k=-2
  - [0,9,4] => [0,-2,9,-2,4]
  - [7,13,14,1,6,1,5] => [7,-2,13,-2,14,-2,1,-2,6,-2,1,-2,5]
  - [16] => [16]
- k=0
  - [2,14,5,2,15,11] => [2,0,14,0,5,0,2,0,15,0,11]
  - [] => []
  - [0,16,9,10,3] => [0,0,16,0,9,0,10,0,3]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [5,11,5,7] => false
  - [13,13,4,1] => false
  - [3,7,9] => false
- k=3
  - [10,11,11,1,15,9] => false
  - [9,48,36] => true
  - [48,6,12] => true
- k=5
  - [30,60,65,40,30,5] => true
  - [35,45,5,25,15,0] => true
  - [11,2,15,10,9,16] => false


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
  - [13,0,9,14,4,9,8] => [0,14,4,8]
  - [10,5] => [10]
  - [6,16] => [6,16]
- k=3
  - [0,27,8] => [0,27]
  - [3,16,4,6,11,1,1] => [3,6]
  - [16,3] => [3]
- k=5
  - [8,12,4,5,12,0,5] => [5,0,5]
  - [13,5,3,1,0,1,7] => [5,0]
  - [0,35,5,11,25,2] => [0,35,5,25]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [15,14] => 14
  - [14,12,16,3,12,2,14,15,0] => 15
  - [5,15,2,1,10,10] => 10
- k=3
  - [0,2,1,9,10] => 2
  - [12,0,4,7,8] => 7
  - [1,7,6,10,3,7,10,11,11,16] => 11


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [16,10,8] => 10
  - [8,12] => 12
  - [10,12,13,1,9,2] => 2
- k=3
  - [13,16,9,14,0,3,7,0,7,11] => 3
  - [14,14,7] => 14
  - [10,7,1,10,16,13,10,3] => 7


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
  - [13] => [1]
  - [] => []
  - [1] => [1]
- k=3
  - [3,12,8,11,6,14,13] => [0,0,2,2,0,2,1]
  - [15,6,2,11,7,12,5] => [0,0,2,2,1,0,2]
  - [] => []
- k=10
  - [8,16,6,10,11] => [8,6,6,0,1]
  - [12,12] => [2,2]
  - [7] => [7]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [14] => [28]
  - [9,7,9,6] => [18,14,18,12]
  - [16,8,10,11] => [32,16,20,22]
- k=3
  - [] => []
  - [0,6] => [0,18]
  - [8,2,1,10,12] => [24,6,3,30,36]
- k=-2
  - [16] => [-32]
  - [8,14,2,7,8] => [-16,-28,-4,-14,-16]
  - [5,9,3,15,5,12] => [-10,-18,-6,-30,-10,-24]
- k=10
  - [2] => [20]
  - [7,9,15,8,7,13,7] => [70,90,150,80,70,130,70]
  - [] => []




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
  - [3,4,6] => [8,16,64]
  - [4,2,10] => [16,4,1024]
  - [4,1,11,7,4] => [16,2,2048,128,16]
- k=3
  - [] => []
  - [11,3,11,4] => [177147,27,177147,81]
  - [2,11] => [9,177147]
- k=4
  - [6,5,6,9,2,6] => [4096,1024,4096,262144,16,4096]
  - [] => []
  - [3,8,0,1,2] => [64,65536,1,4,16]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [5,2,7,12,0] => [25,4,49,144,0]
  - [3,7,8,10,6] => [9,49,64,100,36]
  - [11,7,7,12,14] => [121,49,49,144,196]
- k=3
  - [0,15] => [0,3375]
  - [3,13,0,0] => [27,2197,0,0]
  - [4] => [64]
- k=4
  - [11,15,9] => [14641,50625,6561]
  - [16,16,9] => [65536,65536,6561]
  - [14,4,12,11,15,14] => [38416,256,20736,14641,50625,38416]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [5,14,11,11,6,1,11,11,16] => [14,5,14,11,11,6,1,11,11,16]
  - [5,11] => [11,5,11]
  - [13,5,7,5,10,13,7,13] => [5,13,5,7,5,10,13,7,13]
- k=3
  - [14,3,16] => [16,14,3,16]
  - [15,3,4,2,13,7,13,0] => [4,15,3,4,2,13,7,13,0]
  - [16,16,6,7,9,7,13,3,10] => [6,16,16,6,7,9,7,13,3,10]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [2,11,3,1,13,11,9] => [2,2,11,3,1,13,11,9]
  - [4] => [2,4]
  - [1,2,3,14] => [2,1,2,3,14]
- k=3
  - [0,15,0,1,12,10] => [3,0,15,0,1,12,10]
  - [0] => [3,0]
  - [5,2] => [3,5,2]
- k=-2
  - [] => [-2]
  - [13] => [-2,13]
  - [9,15,9,4] => [-2,9,15,9,4]
- k=10
  - [2,2] => [10,2,2]
  - [8,0] => [10,8,0]
  - [0,13,11,6,16,13,16] => [10,0,13,11,6,16,13,16]




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
  - [0,11,0,4,6] => [0,0,4,6]
  - [1,0] => [1]
  - [14,3,13,6,0] => [14,13,6,0]
- k=3
  - [14,0,6,3] => [14,0,3]
  - [5,1,13,13,5,8,10] => [5,1,13,5,8,10]
  - [15,13,12,0,0,5,0,8,8,9] => [15,13,0,0,5,0,8,8,9]


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
  - [7,12,5] => [7,5]
  - [9,7,2,1,3,1] => [9,7,1,3,1]
  - [14,13,0] => [13]
- k=3
  - [] => []
  - [1,10,2,13,11] => [1,10,2,13,11]
  - [2,1,4,27,16] => [2,1,4,16]
- k=5
  - [5,0,15,10] => []
  - [0] => []
  - [40] => []


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
  - [3] => [3,3]
  - [] => []
  - [14,2,4,12,16] => [14,2,4,12,16,14,2,4,12,16]
- k=3
  - [0] => [0,0,0]
  - [0,14,6,15] => [0,14,6,15,0,14,6,15,0,14,6,15]
  - [11,7] => [11,7,11,7,11,7]
- k=5
  - [] => []
  - [] => []
  - [16] => [16,16,16,16,16]




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
  - [0,7,14] => [0,7,14]
  - [3,2,3,8,12] => [3,2,3,8,12]
  - [] => []
- k=2, n=10
  - [3,2,16,1,3,11,7] => [3,10,16,1,3,11,7]
  - [10,7] => [10,7]
  - [10,2,11,2,4,8] => [10,10,11,10,4,8]
- k=3, n=-2
  - [] => []
  - [] => []
  - [10,11,7,5,13,9,9] => [10,11,7,5,13,9,9]
- k=5, n=0
  - [5,14,8,5,0,12] => [0,14,8,0,0,12]
  - [5,4,5,5,5] => [0,4,0,0,0]
  - [16,16,11,6,10] => [16,16,11,6,10]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [8,13] => [8,8]
  - [10,8] => [10,10]
  - [4,3,2,16,10,1,2,4] => [4,4,4,4,4,4,4,4]
- k=2
  - [12,6,11,5,4,7,0,9] => [6,6,6,6,6,6,6,6]
  - [1,4,11] => [4,4,4]
  - [14,10] => [10,10]
- k=3
  - [8,11,5,3,5,16,5,9,5,8] => [5,5,5,5,5,5,5,5,5,5]
  - [6,16,12,7,14,4,3,15,0,7] => [12,12,12,12,12,12,12,12,12,12]
  - [14,4,8,1,14,0,14,6,13,14] => [8,8,8,8,8,8,8,8,8,8]
- k=5
  - [10,4,16,1,3,10,11,1,7,0] => [3,3,3,3,3,3,3,3,3,3]
  - [10,10,1,15,5,3,8,11,3,8,14,11] => [5,5,5,5,5,5,5,5,5,5,5,5]
  - [6,6,16,16,2,16,2,13,2] => [2,2,2,2,2,2,2,2,2]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [16,11,1,16] => [2,11,1,16]
  - [7,11,2,4] => [2,11,2,4]
  - [11,15,8,13,4] => [2,15,8,13,4]
- k=2, n=10
  - [0,16] => [0,10]
  - [14,3,1,5,8,8,2,13,4] => [14,10,1,5,8,8,2,13,4]
  - [5,15,15] => [5,10,15]
- k=3, n=-2
  - [6,1,5,11,9,2,11,9,6] => [6,1,-2,11,9,2,11,9,6]
  - [9,11,3,12,0,13,10,6,6] => [9,11,-2,12,0,13,10,6,6]
  - [13,4,7,14,16,14,3,8] => [13,4,-2,14,16,14,3,8]
- k=5, n=0
  - [10,7,12,0,3,6,7,8,4,5,0,2] => [10,7,12,0,0,6,7,8,4,5,0,2]
  - [0,10,10,7,13,4,15,12,1,11,11] => [0,10,10,7,0,4,15,12,1,11,11]
  - [7,16,3,9,13,0,6,14,2,7,3,11] => [7,16,3,9,0,0,6,14,2,7,3,11]


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
  - [5,3,4] => [4,5,3]
  - [6,12,4] => [4,6,12]
  - [0,10,7,1] => [1,0,10,7]
- k=3
  - [7,13] => [13,7]
  - [] => []
  - [4,14,9,5] => [14,9,5,4]
- k=-2
  - [5,0,10,1] => [10,1,5,0]
  - [9,4,15] => [15,9,4]
  - [5,13,3,8,6,16] => [3,8,6,16,5,13]
- k=10
  - [] => []
  - [13,14] => [13,14]
  - [2,0,5,13] => [5,13,2,0]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [8,1,7,13,8,1,16,15] => [1,7]
  - [10,5,0,10,0] => [5,0]
  - [15,6,14,10,2,2,5] => [6,14]
- k=2, n=3
  - [5,9,10,10,1,5,1,13,7] => [9,10,10]
  - [3,15,15,13,3,6,8,4,2,8,14] => [15,15,13]
  - [2,5,1,0,14,2,8,1,10] => [5,1,0]
- k=3, n=3
  - [10,5,8,0,9,7,13,6,13] => [8,0,9]
  - [8,16,3,0,9,8,12,9,16,1,2] => [3,0,9]
  - [11,6,14,7,7,10,12,12,2,3,7,12,10] => [14,7,7]
- k=3, n=4
  - [7,13,13,16,8,8,8,3,0,0,6,1,1] => [13,16,8,8]
  - [12,8,4,11,6,16,0,0,6] => [4,11,6,16]
  - [4,8,0,6,16,9,0,2,0] => [0,6,16,9]


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
  - [7,16] => [7,16]
  - [6,9,2,14,15,7,3,7] => [6,9]
  - [11,15,1,12,9,5,4,11,15] => [11,15]
- k=3
  - [8,7,13,15,6,1,1,8] => [8,7,13]
  - [9,12,4,0,1,15,0] => [9,12,4]
  - [0,2,10,16,1,11] => [0,2,10]
- k=5
  - [16,11,16,7,2] => [16,11,16,7,2]
  - [14,12,1,3,2,9,9,11,10,15] => [14,12,1,3,2]
  - [5,15,7,10,4,5,6,5,0,13] => [5,15,7,10,4]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




