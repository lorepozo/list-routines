# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [7,0,16] => [8,1,17]
  - [4,7,8,1,5,13,5] => [5,8,9,2,6,14,6]
  - [2,11,4,9,0,15] => [3,12,5,10,1,16]
- k=2
  - [5,13,6,5,12] => [7,15,8,7,14]
  - [12] => [14]
  - [7,14] => [9,16]
- k=3
  - [14,7,15,8,11,5,1] => [17,10,18,11,14,8,4]
  - [] => []
  - [] => []
- k=-2
  - [] => []
  - [13] => [11]
  - [] => []
- k=10
  - [1,8] => [11,18]
  - [2] => [12]
  - [10,11] => [20,21]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [9,16] => [9,16,16]
  - [16,13] => [16,13,13]
  - [6,14,0,6,3,5] => [6,14,0,6,3,5,14]
- k=3
  - [14,12,6,15,10,11] => [14,12,6,15,10,11,6]
  - [2,4,2,5,4,1,16,13,11,9] => [2,4,2,5,4,1,16,13,11,9,2]
  - [12,15,16,8,11,0] => [12,15,16,8,11,0,16]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [7,6,8,12] => [7,6,8,12,2]
  - [] => [2]
  - [] => [2]
- k=3
  - [15,14,11,5] => [15,14,11,5,3]
  - [10,9,1] => [10,9,1,3]
  - [15,6,13] => [15,6,13,3]
- k=-2
  - [0,3,7] => [0,3,7,-2]
  - [] => [-2]
  - [3,3,15,11,14,12] => [3,3,15,11,14,12,-2]
- k=10
  - [8] => [8,10]
  - [10] => [10,10]
  - [6,1,8,11,14,13] => [6,1,8,11,14,13,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [0,5] => [2,0]
  - [0,2,0,6,0,0] => [2,4,2,1,2,2]
  - [1,3,6,0,0,4,2] => [3,5,1,2,2,6,4]
- k=1, n=10
  - [8,7,4,0,9,8,8] => [9,8,5,1,0,9,9]
  - [6,7] => [7,8]
  - [6,6,9,3,5,3,7] => [7,7,0,4,6,4,8]
- k=10, n=26
  - [21,25] => [5,9]
  - [4,12,9] => [14,22,19]
  - [24,11] => [8,21]
- k=13, n=26
  - [5] => [18]
  - [25,12,19,9,25,5] => [12,25,6,22,12,18]
  - [5,10,3,4,6,10,25] => [18,23,16,17,19,23,12]


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
  - [2,2,10,2,2,2,2] => 6
  - [16,13,12,6,0] => 0
  - [2,16,13,9,4] => 1
- k=3
  - [13,4] => 0
  - [14,1,9,2,3,12] => 1
  - [] => 0
- k=10
  - [8,10,10] => 2
  - [0,10,10,10] => 3
  - [15,6,15] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [15,12] => []
  - [1,4,5,12,6,1,7,16] => [5,12,6,1,7,16]
  - [4,9,10,3,9,8,14,15,0] => [10,3,9,8,14,15,0]
- k=3
  - [10,0,8,16,6,1,6,10,10,15] => [16,6,1,6,10,10,15]
  - [2,12,1,8,8,11,4,2,15] => [8,8,11,4,2,15]
  - [6,13,2,3,7,11,6,0,0,0] => [3,7,11,6,0,0,0]
- k=5
  - [12,14,12,12,9,13,10,9,10,8,10,13] => [13,10,9,10,8,10,13]
  - [13,12,10,3,3] => []
  - [11,6,1,0,7,12,16] => [12,16]




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
  - [10,4,7,2,7,15] => true
  - [14,1,9] => false
  - [1,14,5,9,11,13] => false
- k=3
  - [12,6] => false
  - [1,11,3,9,11,13,3] => true
  - [3,3,3] => true
- k=10
  - [10] => true
  - [2] => false
  - [10,16,2,1,11,5,16] => true




### head

`head` gets the first element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




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
  - [13,4,5] => 4
  - [10,15,9,3,2,8,12] => 15
  - [5,15] => 15
- k=3
  - [5,2,14,6,3] => 14
  - [13,7,13,0,3,1,11,8,5] => 13
  - [10,9,16,9] => 16


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [13,7,14,6,6] => [13,1,7,1,14,1,6,1,6]
  - [] => []
  - [5,3,9] => [5,1,3,1,9]
- k=10
  - [11,6,15,16] => [11,10,6,10,15,10,16]
  - [2,8,5,7] => [2,10,8,10,5,10,7]
  - [16] => [16]
- k=-2
  - [5,1,12,15,8] => [5,-2,1,-2,12,-2,15,-2,8]
  - [8] => [8]
  - [12,10,3] => [12,-2,10,-2,3]
- k=0
  - [] => []
  - [6,10,6,8,11] => [6,0,10,0,6,0,8,0,11]
  - [5,16,4,8,0,3] => [5,0,16,0,4,0,8,0,0,0,3]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [5,13,4,11,13,8] => false
  - [] => true
  - [12] => true
- k=3
  - [3] => true
  - [] => true
  - [] => true
- k=5
  - [25,80,20,20,25] => true
  - [40,20,50,5] => true
  - [0,12,8,12] => false


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

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
  - [10,2,5,0] => [10,2,0]
  - [2,2,7,15,6] => [2,2,6]
  - [8] => [8]
- k=3
  - [14,3,12,27,24] => [3,12,27,24]
  - [] => []
  - [10,15,6,18,9,12] => [15,6,18,9,12]
- k=5
  - [5] => [5]
  - [] => []
  - [0,0,30,10,25,14] => [0,0,30,10,25]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [1,10] => 1
  - [7,5] => 5
  - [7,7,8,11,10] => 10
- k=3
  - [1,4,11,9,15,15,6,10,0] => 11
  - [5,5,5] => 5
  - [10,3,13,12,11,7,12,0] => 12


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [14,12,13,1] => 12
  - [7,5,11,0,5,0,13,1,13] => 0
  - [1,15,16,1] => 1
- k=3
  - [2,1,12,11,11,5,5,14] => 5
  - [8,1,12,12,16] => 12
  - [16,0,15,15,2,6,5] => 5


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
  - [8,2,3,14] => [0,0,1,0]
  - [1,0,5,16] => [1,0,1,0]
  - [15,15,16,1,6,6] => [1,1,0,1,0,0]
- k=3
  - [14,7] => [2,1]
  - [0,6,10,1] => [0,0,1,1]
  - [11,4,2] => [2,1,2]
- k=10
  - [7,2,7,13,15,13,9] => [7,2,7,3,5,3,9]
  - [1,0,8,3,4] => [1,0,8,3,4]
  - [3,8,6] => [3,8,6]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [11,12,9,1,7,6,13] => [22,24,18,2,14,12,26]
  - [4,1] => [8,2]
  - [7,10,9,0,3] => [14,20,18,0,6]
- k=3
  - [13] => [39]
  - [16,11,4,11,7,9] => [48,33,12,33,21,27]
  - [0,14] => [0,42]
- k=-2
  - [16,6,8] => [-32,-12,-16]
  - [8,3,16,11,16,4,12] => [-16,-6,-32,-22,-32,-8,-24]
  - [] => []
- k=10
  - [] => []
  - [6,10,4,4] => [60,100,40,40]
  - [12,9] => [120,90]




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
  - [10,1,11,6,9] => [1024,2,2048,64,512]
  - [1,10,2,0,8,9] => [2,1024,4,1,256,512]
- k=3
  - [6,6,1] => [729,729,3]
  - [2,7,2,10,1,9] => [9,2187,9,59049,3,19683]
  - [5,6,1,9,0] => [243,729,3,19683,1]
- k=4
  - [11,10,0,3,5,7,8] => [4194304,1048576,1,64,1024,16384,65536]
  - [11,9,8] => [4194304,262144,65536]
  - [7,7,11] => [16384,16384,4194304]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [8] => [64]
  - [3,1,3,9,5,7,11] => [9,1,9,81,25,49,121]
  - [] => []
- k=3
  - [] => []
  - [16,5,5,11,2,7,4] => [4096,125,125,1331,8,343,64]
  - [11,7,1,9,10,7,11] => [1331,343,1,729,1000,343,1331]
- k=4
  - [0,11,15,16,7,8,7] => [0,14641,50625,65536,2401,4096,2401]
  - [6,7,5,16,9,16] => [1296,2401,625,65536,6561,65536]
  - [] => []


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [15,3,12,14,7,8] => [3,15,3,12,14,7,8]
  - [6,7,14,10,3,6] => [7,6,7,14,10,3,6]
  - [13,10,9,12,2,2,14] => [10,13,10,9,12,2,2,14]
- k=3
  - [8,13,0,4,7,5,14] => [0,8,13,0,4,7,5,14]
  - [14,8,14,9,2] => [14,14,8,14,9,2]
  - [4,5,7,10,0,8,16,4,0,14] => [7,4,5,7,10,0,8,16,4,0,14]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [1,1,13,16,4] => [2,1,1,13,16,4]
  - [6] => [2,6]
  - [1,15,6] => [2,1,15,6]
- k=3
  - [16] => [3,16]
  - [4,3,2,8,7,16] => [3,4,3,2,8,7,16]
  - [3] => [3,3]
- k=-2
  - [2,11,7,15,3] => [-2,2,11,7,15,3]
  - [12,4,9,12,6] => [-2,12,4,9,12,6]
  - [] => [-2]
- k=10
  - [15] => [10,15]
  - [13,13,2,12,9] => [10,13,13,2,12,9]
  - [3,9,14,6,0,7] => [10,3,9,14,6,0,7]




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
  - [9,16,15,6,6,14,13] => [9,15,6,6,14,13]
  - [6,9,10,10,4] => [6,10,10,4]
  - [5,0,15] => [5,15]
- k=3
  - [12,16,0,3,4,2,8] => [12,16,3,4,2,8]
  - [4,8,4,3,12,3,8,15] => [4,8,3,12,3,8,15]
  - [8,8,9,1] => [8,8,1]


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
  - [3,1,11,2] => [3,1,11]
  - [4,2,5] => [5]
  - [13,8,2,4,13] => [13,13]
- k=3
  - [4,10,8,10,4,2] => [4,10,8,10,4,2]
  - [16,12] => [16]
  - [16,0,0,8,11] => [16,8,11]
- k=5
  - [13,15,14] => [13,14]
  - [16,10] => [16]
  - [45,4,12,11,10,45,7] => [4,12,11,7]


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
  - [2,0,3] => [2,0,3,2,0,3]
  - [13,16,1,2,15] => [13,16,1,2,15,13,16,1,2,15]
  - [14,9,8,5,16] => [14,9,8,5,16,14,9,8,5,16]
- k=3
  - [8] => [8,8,8]
  - [] => []
  - [10,2,4,8] => [10,2,4,8,10,2,4,8,10,2,4,8]
- k=5
  - [8,12,0,2] => [8,12,0,2,8,12,0,2,8,12,0,2,8,12,0,2,8,12,0,2]
  - [5,10] => [5,10,5,10,5,10,5,10,5,10]
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
  - [8,0,3,15,7,9] => [8,0,3,15,7,9]
  - [16,3,13,10,3] => [16,3,13,10,3]
  - [11,1,1] => [11,2,2]
- k=2, n=10
  - [2] => [10]
  - [2,2,2,14,2,2,2] => [10,10,10,14,10,10,10]
  - [2,2] => [10,10]
- k=3, n=-2
  - [10,16,9,6] => [10,16,9,6]
  - [0,3,13,11,0,6,6] => [0,-2,13,11,0,6,6]
  - [10,8,3] => [10,8,-2]
- k=5, n=0
  - [10,10,6,13] => [10,10,6,13]
  - [] => []
  - [10,3,15,0,7] => [10,3,15,0,7]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [12] => [12]
  - [15,2] => [15,15]
  - [15,3,8,14,5,14,15,2] => [15,15,15,15,15,15,15,15]
- k=2
  - [3,14,12,9,15] => [14,14,14,14,14]
  - [5,8,14,3,7] => [8,8,8,8,8]
  - [12,7,14,12] => [7,7,7,7]
- k=3
  - [7,0,13,4,9,12,5,15,13,11] => [13,13,13,13,13,13,13,13,13,13]
  - [4,6,6,5,15] => [6,6,6,6,6]
  - [7,16,10] => [10,10,10]
- k=5
  - [5,0,0,16,16,1,10,1,4,1,16] => [16,16,16,16,16,16,16,16,16,16,16]
  - [14,6,15,1,7,14,11,14,11,5,4] => [7,7,7,7,7,7,7,7,7,7,7]
  - [0,8,1,7,1,16,9,8,2,13,8] => [1,1,1,1,1,1,1,1,1,1,1]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [0,11,4,14] => [2,11,4,14]
  - [6,15,5,1,8,2,6] => [2,15,5,1,8,2,6]
  - [0,2,10,7] => [2,2,10,7]
- k=2, n=10
  - [14,13,8,7,11,10] => [14,10,8,7,11,10]
  - [15,2,5,15,10] => [15,10,5,15,10]
  - [6,9,4,9,14] => [6,10,4,9,14]
- k=3, n=-2
  - [2,14,0,13,13] => [2,14,-2,13,13]
  - [8,0,12,0] => [8,0,-2,0]
  - [4,9,2,4,12,11,13,4,12,15] => [4,9,-2,4,12,11,13,4,12,15]
- k=5, n=0
  - [10,2,3,10,3] => [10,2,3,10,0]
  - [0,1,1,9,15,16] => [0,1,1,9,0,16]
  - [1,13,5,3,1,13] => [1,13,5,3,0,13]


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
  - [0] => [0]
  - [] => []
  - [12,2,2,8] => [8,12,2,2]
- k=3
  - [7,7,13,7,15] => [13,7,15,7,7]
  - [7,15,8,0] => [15,8,0,7]
  - [16,6,5,14,16,12,5] => [16,12,5,16,6,5,14]
- k=-2
  - [0,12,12,4,0,4] => [12,4,0,4,0,12]
  - [11,5,7,15,12] => [7,15,12,11,5]
  - [12] => [12]
- k=10
  - [6,2,0,9,16] => [6,2,0,9,16]
  - [7,11,1,8,5,13] => [1,8,5,13,7,11]
  - [2,4] => [2,4]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [14,6,12,0,15,8,7,7,16,9] => [6,12]
  - [4,16,14,5,8,13,7,0,0] => [16,14]
  - [3,16,13,15,9] => [16,13]
- k=2, n=3
  - [5,8,13,11,3,16,12,0,14,15,13] => [8,13,11]
  - [8,10,6,12,13,2,2,1] => [10,6,12]
  - [10,16,6,8,6,14,4,15,2,9] => [16,6,8]
- k=3, n=3
  - [8,4,2,0,4,12,2,4,7,2] => [2,0,4]
  - [7,7,13,3,4,15,14,4,1] => [13,3,4]
  - [2,4,13,14,13,15,3,14,15,5,7,8] => [13,14,13]
- k=3, n=4
  - [10,12,13,9,13,9,4,16,3] => [13,9,13,9]
  - [16,5,5,4,9,12,2,1,9,14,9,12] => [5,4,9,12]
  - [0,16,10,2,3,4,16,15] => [10,2,3,4]


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
  - [2,4,15,13,4] => [2,4]
  - [9,5] => [9,5]
  - [12,11,0,4,14,12,5,9,6] => [12,11]
- k=3
  - [7,9,5,9,1,15,7,1,9,8] => [7,9,5]
  - [10,7,10,5,6,4,4] => [10,7,10]
  - [13,4,6,7,9,3,10] => [13,4,6]
- k=5
  - [11,4,6,9,9,13,11,6,13,0,14] => [11,4,6,9,9]
  - [13,16,3,9,5,8,6,14] => [13,16,3,9,5]
  - [8,3,4,0,16,2,5,11,10,1,1,15] => [8,3,4,0,16]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




