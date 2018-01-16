# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [5] => [7]
  - [8,11,6,7,1] => [10,13,8,9,3]
  - [] => []
- k=3
  - [] => []
  - [] => []
  - [9,3,7] => [12,6,10]
- k=-2
  - [6,4,3,3,2,10,6] => [4,2,1,1,0,8,4]
  - [8,2,9,14,1,11] => [6,0,7,12,-1,9]
  - [4,5,14,11,14,14,6] => [2,3,12,9,12,12,4]
- k=10
  - [7,13,3,1,3] => [17,23,13,11,13]
  - [2,9,7,12] => [12,19,17,22]
  - [7,12,10,11,10] => [17,22,20,21,20]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [8,16,4,6] => [8,16,4,6,2]
  - [] => [2]
  - [9,12,13] => [9,12,13,2]
- k=3
  - [10,5,13,10,9] => [10,5,13,10,9,3]
  - [] => [3]
  - [16,3,5,4] => [16,3,5,4,3]
- k=-2
  - [11,15,15,12,2,0,1] => [11,15,15,12,2,0,1,-2]
  - [10,4] => [10,4,-2]
  - [5,12,14,15,6] => [5,12,14,15,6,-2]
- k=10
  - [7,3,11,9,3,5,11] => [7,3,11,9,3,5,11,10]
  - [12,8,0,6,6] => [12,8,0,6,6,10]
  - [3] => [3,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [7,2] => [2,4]
  - [10,13,16,2,10,14,15] => [5,1,4,4,5,2,3]
  - [0,11,5,8,8,0] => [2,6,0,3,3,2]
- k=1, n=10
  - [1,6,8,15,14] => [2,7,9,6,5]
  - [4] => [5]
  - [] => []
- k=10, n=26
  - [6,8,4,16] => [16,18,14,0]
  - [10] => [20]
  - [6,2] => [16,12]
- k=13, n=26
  - [5,7,0,12,2] => [18,20,13,25,15]
  - [] => []
  - [2,11,9,6] => [15,24,22,19]


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
- [head](#head-parametric)
- [tail](#tail-parametric)
- [count-k](#count-k-parametric)

### count-k (parametric)

`count-k` counts occurrences of the number `k`.

Examples:
- k=2
  - [11] => 0
  - [2] => 1
  - [6] => 0
- k=3
  - [3,9,2,14,4,0,5] => 1
  - [13,13,1,3,14,11] => 1
  - [8,10,6,9,12,16,3] => 1
- k=10
  - [5,10] => 1
  - [] => 0
  - [1] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [16,11,14,15,6,0,7,16] => [14,15,6,0,7,16]
  - [9,10,11,1,6] => [11,1,6]
  - [13,9,12,7,0,5,10] => [12,7,0,5,10]
- k=3
  - [11,13,10,6,8,10,2,16,15,0] => [6,8,10,2,16,15,0]
  - [0,3,8,11,9,9,5,3] => [11,9,9,5,3]
  - [13,11,13,11] => [11]
- k=5
  - [8,8,15,5,7,3,3,8] => [3,3,8]
  - [1,6,8,15,4,7,9,0] => [7,9,0]
  - [2,5,15,11,12,0] => [0]




### dup

`dup` duplicates each element.

Examples:
- [0] => [0,0]
- [7,2,4] => [7,7,2,2,4,4]




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
- [head](#head-parametric)
- [tail](#tail-parametric)
- [has-k](#has-k-parametric)

### has-k (parametric)

`has-k` checks if the number `k` occurs in the list.

Examples:
- k=2
  - [9,12] => false
  - [1,0,13,0,15,0,2,12] => true
  - [2,16,10,10,12,7,10] => true
- k=3
  - [13,9,3] => true
  - [12,15,3] => true
  - [4,7,12,8,7,15] => false
- k=10
  - [13,10,10,14,8,8,4,0] => true
  - [8,10,2] => true
  - [10,11,1] => true




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
- [head](#head-parametric)
- [tail](#tail-parametric)
- [index-k](#index-k-parametric)

### index-k (parametric)

`index-k` get the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [4,14,5] => 14
  - [2,13] => 13
  - [15,10,4,15,11,10,7] => 10
- k=3
  - [6,0,12] => 12
  - [12,6,5,13] => 5
  - [1,15,2,1] => 2


Conceptual dependencies:
- [head](#head-parametric)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [16,10] => [16,1,10]
  - [5,11,14] => [5,1,11,1,14]
  - [15,12,6,5,1,16,6] => [15,1,12,1,6,1,5,1,1,1,16,1,6]
- k=10
  - [11,5,16,9,5,12,6] => [11,10,5,10,16,10,9,10,5,10,12,10,6]
  - [11,14,0,13] => [11,10,14,10,0,10,13]
  - [] => []
- k=-2
  - [10,7,12,1,15] => [10,-2,7,-2,12,-2,1,-2,15]
  - [4,10,15] => [4,-2,10,-2,15]
  - [3,14,8] => [3,-2,14,-2,8]
- k=0
  - [6,10,14] => [6,0,10,0,14]
  - [8,16,4] => [8,0,16,0,4]
  - [6,10,13,9,16,2] => [6,0,10,0,13,0,9,0,16,0,2]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [11,5,10,7,8,5,2] => false
  - [16] => true
  - [1,6,2,2,5] => false
- k=3
  - [7,15,9,7,16,10,15] => false
  - [2,1] => false
  - [8,8,5,16,15,6,10] => false
- k=5
  - [12,14,10,0,2,5,2] => false
  - [8,4,6] => false
  - [8,0,1,2,4] => false


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

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
- [head](#head-parametric)
- [tail](#tail-parametric)
- [keep-mod-k](#keep-mod-k-parametric)

### keep-mod-k (parametric)

`keep-mod-k` gets elements which are divisible by `k`.

Examples:
- k=2
  - [] => []
  - [0,8,13] => [0,8]
  - [16,1,16] => [16,16]
- k=3
  - [] => []
  - [2] => []
  - [0,1,13,16,3] => [0,3]
- k=5
  - [15,8,8] => [15]
  - [14] => []
  - [2,9,14,10,2,4] => [10]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [15,13,2,2,8,13,13] => 13
  - [7,8] => 7
  - [10,0,7,6] => 7
- k=3
  - [5,5,10,15,9,14,6] => 10
  - [16,11,13,16,12,13,15,10] => 15
  - [9,14,2,11,4,8,13,8,16] => 13


Conceptual dependencies:
- [max](#max-parametric)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [9,0,4,1,15,16,10,7] => 1
  - [10,1] => 10
  - [12,0,14] => 12
- k=3
  - [6,6,11,11,5,9] => 6
  - [2,16,11,5,4] => 5
  - [9,12,12,5] => 12


Conceptual dependencies:
- [min](#min-parametric)

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
  - [10,2,6,5] => [0,0,0,1]
  - [9,8,4] => [1,0,0]
  - [10,4,10,16,4,3,8] => [0,0,0,0,0,1,0]
- k=3
  - [5,0,2,14,0,14] => [2,0,2,2,0,2]
  - [13,0,10,11,11,2,5] => [1,0,1,2,2,2,2]
  - [4,12,11] => [1,0,2]
- k=10
  - [] => []
  - [8,1] => [8,1]
  - [4,5,11,14] => [4,5,1,4]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [7,3] => [14,6]
  - [9] => [18]
  - [1,13,5,11] => [2,26,10,22]
- k=3
  - [9,4,14,10] => [27,12,42,30]
  - [8,15,14] => [24,45,42]
  - [] => []
- k=-2
  - [8,7,2,4,3,11,16] => [-16,-14,-4,-8,-6,-22,-32]
  - [11,1,2] => [-22,-2,-4]
  - [15,16] => [-30,-32]
- k=10
  - [8,8] => [80,80]
  - [12,3] => [120,30]
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




### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [8,16,15,4] => [2,8,16,15,4]
  - [10,0,6,3] => [2,10,0,6,3]
  - [14] => [2,14]
- k=3
  - [7,14,15,3,1,7] => [3,7,14,15,3,1,7]
  - [10,7,2,9,15,10] => [3,10,7,2,9,15,10]
  - [5,16,4,0,7] => [3,5,16,4,0,7]
- k=-2
  - [13,16,6,8,4,5] => [-2,13,16,6,8,4,5]
  - [0,6,10,0,9] => [-2,0,6,10,0,9]
  - [2,0,11,8] => [-2,2,0,11,8]
- k=10
  - [8] => [10,8]
  - [0,12,2,2,13,4,14] => [10,0,12,2,2,13,4,14]
  - [15,14,16,6,14,3] => [10,15,14,16,6,14,3]




### product

`product` multiplies all elements of the list.

Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 2




### remove-index-k (parametric)

`remove-index-k` removes the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [8,2,16,3,11,13,12,5,1] => [8,16,3,11,13,12,5,1]
  - [3,14,1,7,0] => [3,1,7,0]
  - [5,9,5,6,13,13,5,6,4] => [5,5,6,13,13,5,6,4]
- k=3
  - [6,8,1,5,11,16] => [6,8,5,11,16]
  - [1,13,5,1,7,14,11,15,5] => [1,13,1,7,14,11,15,5]
  - [12,10,1,16,9,7] => [12,10,16,9,7]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### remove-mod-head

`remove-mod-head` gets elements after the first number which are not divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [1,4,7,2]
- [4,2,6,10,8,12] => [2,6,10]
- [1,2,3] => []


Conceptual dependencies:
- [head](#head-parametric)
- [tail](#tail-parametric)
- [remove-mod-k](#remove-mod-k-parametric)

### remove-mod-k (parametric)

`remove-mod-k` gets elements which are not divisible by `k`.

Examples:
- k=2
  - [7,12,2,10,7,6,4] => [7,7]
  - [3] => [3]
  - [6,14,0,1] => [1]
- k=3
  - [4,9,0,15,5,0,8] => [4,5,8]
  - [5,14,13,11] => [5,14,13,11]
  - [1,5,12,7,2] => [1,5,7,2]
- k=5
  - [5,13,8,9,13] => [13,8,9,13]
  - [5,0,2] => [2]
  - [1,2,7] => [1,2,7]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [4,14,6,12,2,7] => [4,14,6,12,2,7]
  - [4,5,3,0,1,13,8] => [4,5,3,0,2,13,8]
  - [4,10,7,0,16,13] => [4,10,7,0,16,13]
- k=2, n=10
  - [2,2,9,14,6] => [10,10,9,14,6]
  - [10,4,12,7,15,16,14] => [10,4,12,7,15,16,14]
  - [0,4,1,3,3] => [0,4,1,3,3]
- k=3, n=-2
  - [12,16] => [12,16]
  - [6,15,12,4,5] => [6,15,12,4,5]
  - [13,10,11,2,16,5] => [13,10,11,2,16,5]
- k=5, n=0
  - [14,0,13,9,9] => [14,0,13,9,9]
  - [9] => [9]
  - [15,8] => [15,8]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [16,16,6,15,1,5,13,6] => [16,16,16,16,16,16,16,16]
  - [16,13,11,7] => [16,16,16,16]
  - [2,13,15,7,9,7,2,6] => [2,2,2,2,2,2,2,2]
- k=2
  - [7,3,8,12,11,15,12,3] => [3,3,3,3,3,3,3,3]
  - [9,14,0,8,7,12,13,7] => [14,14,14,14,14,14,14,14]
  - [0,16,9,10,10] => [16,16,16,16,16]
- k=3
  - [1,9,9,12,2,10,11,8] => [9,9,9,9,9,9,9,9]
  - [7,14,7,13,4,2] => [7,7,7,7,7,7]
  - [0,16,11,5] => [11,11,11,11]
- k=5
  - [1,7,13,5,10,15,13,1,13,16] => [10,10,10,10,10,10,10,10,10,10]
  - [4,2,7,4,9,4,15,5,5] => [9,9,9,9,9,9,9,9,9]
  - [13,10,3,13,15] => [15,15,15,15,15]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [7,1,7,13] => [2,1,7,13]
  - [0,11,12,12] => [2,11,12,12]
  - [3,5,12,15,14] => [2,5,12,15,14]
- k=2, n=10
  - [11,0,14,15,4,3,0] => [11,10,14,15,4,3,0]
  - [4,14,10,6,3] => [4,10,10,6,3]
  - [13,7,9,16,9,10,3] => [13,10,9,16,9,10,3]
- k=3, n=-2
  - [5,6,10,0] => [5,6,-2,0]
  - [8,4,1,6,0,12,16,2,13] => [8,4,-2,6,0,12,16,2,13]
  - [16,7,9,8,6,5,4,12,2,0] => [16,7,-2,8,6,5,4,12,2,0]
- k=5, n=0
  - [6,2,2,5,12,7,13] => [6,2,2,5,0,7,13]
  - [8,3,5,15,12,4,8,10,13] => [8,3,5,15,0,4,8,10,13]
  - [12,8,1,0,13,15,8,0] => [12,8,1,0,0,15,8,0]


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
  - [7,7,7] => [7,7,7]
  - [1,7] => [7,1]
  - [1,4,9,10,10,16] => [4,9,10,10,16,1]
- k=3
  - [8,4,1,1,10] => [1,10,8,4,1]
  - [0,6,9,5,5] => [5,5,0,6,9]
  - [5,8,6] => [5,8,6]
- k=-2
  - [1,7,15,8,8,11,2] => [11,2,1,7,15,8,8]
  - [10,12] => [10,12]
  - [0,5,6,5] => [6,5,0,5]
- k=10
  - [10] => [10]
  - [] => []
  - [6,6,14,16,13,8,6] => [16,13,8,6,6,6,14]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [3,15,2,11,4] => [15,2]
  - [2,2,3,3,11,15,15,14,15,6,9] => [2,3]
  - [4,1,4,16,12,14,13,13,12] => [1,4]
- k=2, n=3
  - [15,13,5,11,15,12,0,9,5] => [13,5,11]
  - [12,1,14,13,8,12,3,11,14,4,5,11] => [1,14,13]
  - [16,14,14,12,11,11,5,0,6,10,7,0] => [14,14,12]
- k=3, n=3
  - [16,16,1,8,6,2,13,11,1,2,15,8,14,2] => [1,8,6]
  - [6,16,7,1,16,14,9,12,6,13,7,5] => [7,1,16]
  - [7,2,1,3,16,4,5,3,11] => [1,3,16]
- k=3, n=4
  - [8,11,16,2,15,5,9,13,6,0,16,12,1,3] => [16,2,15,5]
  - [5,4,5,10,5,1,10,0,13,6] => [5,10,5,1]
  - [8,1,1,13,7,15,7,6,12,5,3,12,0,2,10] => [1,13,7,15]


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
  - [9,11,14,15] => [9,11]
  - [16,8,13] => [16,8]
  - [11,13,5,12,0] => [11,13]
- k=3
  - [10,10,0,8,13,6,11,5,7] => [10,10,0]
  - [9,11,5] => [9,11,5]
  - [14,0,13,7,1,3,3,0,3,3] => [14,0,13]
- k=5
  - [4,4,14,2,14,7] => [4,4,14,2,14]
  - [13,9,5,11,8,5,6,11,11,16,2] => [13,9,5,11,8]
  - [10,1,3,8,0,4,5,8] => [10,1,3,8,0]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




