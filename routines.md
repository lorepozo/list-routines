# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [] => []
  - [8,13,0,6,2] => [10,15,2,8,4]
  - [12,8,13,5,0] => [14,10,15,7,2]
- k=3
  - [] => []
  - [3,4,0,7,0] => [6,7,3,10,3]
  - [12,1] => [15,4]
- k=-2
  - [0,15,8,11,8] => [-2,13,6,9,6]
  - [] => []
  - [10] => [8]
- k=10
  - [10,13,6,6] => [20,23,16,16]
  - [15] => [25]
  - [] => []




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,8,13] => [5,8,13,2]
  - [13,1,12,4,12,11,2] => [13,1,12,4,12,11,2,2]
  - [15,7] => [15,7,2]
- k=3
  - [0,3] => [0,3,3]
  - [7,3,4,8,13] => [7,3,4,8,13,3]
  - [12,10,5] => [12,10,5,3]
- k=-2
  - [8,0,4,9,8] => [8,0,4,9,8,-2]
  - [9,13] => [9,13,-2]
  - [4] => [4,-2]
- k=10
  - [] => [10]
  - [] => [10]
  - [] => [10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [3,5,4] => [5,0,6]
  - [1,1,5,6] => [3,3,0,1]
  - [4,5,3,3] => [6,0,5,5]
- k=1, n=10
  - [5,8] => [6,9]
  - [5,2,3,0] => [6,3,4,1]
  - [5,4,7,4] => [6,5,8,5]
- k=10, n=26
  - [19,18,22] => [3,2,6]
  - [13,11,7,14] => [23,21,17,24]
  - [5,17,0] => [15,1,10]
- k=13, n=26
  - [2,8,19,6,21] => [15,21,6,19,8]
  - [2,24,25,17,19] => [15,11,12,4,6]
  - [9,2] => [22,15]


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
  - [] => 0
  - [8,9,9,10,0,6] => 0
  - [16] => 0
- k=3
  - [] => 0
  - [3,3,9,3,3,14] => 4
  - [5,11,7,3,3] => 2
- k=10
  - [11,16,7,1,4] => 0
  - [5,6,11,11,4,16] => 0
  - [13] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [13,15,15,7,12,13,5] => [15,7,12,13,5]
  - [6,0,14,9] => [14,9]
  - [14,9,4] => [4]
- k=3
  - [6,12,3,7,5] => [7,5]
  - [3,8,0,8,14,13,12,11,12] => [8,14,13,12,11,12]
  - [5,10,13] => []
- k=5
  - [11,6,4,10,2,12,10,11,15] => [12,10,11,15]
  - [5,13,2,3,7] => []
  - [12,13,14,1,12,6,0,3] => [6,0,3]




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
  - [2,2,2] => true
  - [] => false
  - [4,16,1] => false
- k=3
  - [13,0,12,11,16,2,13] => false
  - [8,5,1,3,7,12,15] => true
  - [12,15,12,13,16,10,5] => false
- k=10
  - [11,8,6,10,16] => true
  - [14,11,10,10,2,10] => true
  - [10,10,10] => true




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
  - [3,6,11,13,5,7,15,4,16] => 6
  - [10,7,0] => 7
  - [12,14,16] => 14
- k=3
  - [4,14,8,16,10,15,5,7,7] => 8
  - [5,6,0,2,12,1] => 0
  - [11,8,3,8,3,11,7] => 3


Conceptual dependencies:
- [head](#head-parametric)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [15,8,2,14] => [15,1,8,1,2,1,14]
  - [7,11,8] => [7,1,11,1,8]
  - [13,1,7,14] => [13,1,1,1,7,1,14]
- k=10
  - [2,8,12,16,10,1] => [2,10,8,10,12,10,16,10,10,10,1]
  - [14,6,3,14,9,14] => [14,10,6,10,3,10,14,10,9,10,14]
  - [10,15,1,16] => [10,10,15,10,1,10,16]
- k=-2
  - [12] => [12]
  - [10,10,6] => [10,-2,10,-2,6]
  - [0,4,11,9,10] => [0,-2,4,-2,11,-2,9,-2,10]
- k=0
  - [10,6,5] => [10,0,6,0,5]
  - [14,14,7] => [14,0,14,0,7]
  - [6,2,8,4,14] => [6,0,2,0,8,0,4,0,14]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [] => true
  - [20,26,0,4] => true
  - [12,3,0,6,0,14,10] => false
- k=3
  - [8] => false
  - [27,12,42,39,9,45] => true
  - [4] => false
- k=5
  - [30,40,15,80] => true
  - [8,6,1,2,7] => false
  - [20,80,30,80,25] => true


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
  - [7,18,1,16,15,3] => [18,16]
  - [4,9,6,6] => [4,6,6]
  - [14,8,14,12,2] => [14,8,14,12,2]
- k=3
  - [3,3,7] => [3,3]
  - [15,5,24,4,2,6] => [15,24,6]
  - [1,1] => []
- k=5
  - [14,15,11] => [15]
  - [20] => [20]
  - [5] => [5]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [5,0,0,10] => 5
  - [3,14,13,2,10,12,3] => 13
  - [10,9,1] => 9
- k=3
  - [16,5,14,10,13,15,11] => 14
  - [8,1,2,4,16,12,5,1,11,13] => 12
  - [15,7,14,15] => 14


Conceptual dependencies:
- [max](#max-parametric)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [10,3,9,3,11] => 3
  - [11,7,1,1] => 1
  - [16,13,10,0,6,13,0,10] => 0
- k=3
  - [10,1,7,3,12,10,10,12,1] => 3
  - [5,16,10,2,3,6,15,0] => 3
  - [14,0,0,16] => 14


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
  - [] => []
  - [0,1,1,3,16,9] => [0,1,1,1,0,1]
  - [7,9] => [1,1]
- k=3
  - [5,13,15,0,2] => [2,1,0,0,2]
  - [] => []
  - [8,14,13] => [2,2,1]
- k=10
  - [4,1,14,8,11] => [4,1,4,8,1]
  - [3,14,15,12,1] => [3,4,5,2,1]
  - [12,13,9,16,0,2,12] => [2,3,9,6,0,2,2]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [4,2,2,5] => [8,4,4,10]
  - [16,11] => [32,22]
  - [2,2,6,15] => [4,4,12,30]
- k=3
  - [10,4,15,10] => [30,12,45,30]
  - [13,3,2,2,14,8,3] => [39,9,6,6,42,24,9]
  - [5,14,15,2,15,14,5] => [15,42,45,6,45,42,15]
- k=-2
  - [12,13,2,11,8,2,11] => [-24,-26,-4,-22,-16,-4,-22]
  - [9,13,10,16] => [-18,-26,-20,-32]
  - [8,11,15,3,7] => [-16,-22,-30,-6,-14]
- k=10
  - [9,14,16,10,3,10] => [90,140,160,100,30,100]
  - [6,10,14] => [60,100,140]
  - [4,10] => [40,100]




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
  - [12] => [2,12]
  - [10,12,8] => [2,10,12,8]
  - [9,6,14,6,12,16] => [2,9,6,14,6,12,16]
- k=3
  - [7,6,4,5,15,4,7] => [3,7,6,4,5,15,4,7]
  - [2] => [3,2]
  - [4,8,1] => [3,4,8,1]
- k=-2
  - [11,5,2,9,14,12,0] => [-2,11,5,2,9,14,12,0]
  - [16] => [-2,16]
  - [3,15,5,3,7,3] => [-2,3,15,5,3,7,3]
- k=10
  - [6,6,6,12] => [10,6,6,6,12]
  - [11,13,7,7] => [10,11,13,7,7]
  - [] => [10]




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
  - [14,3,13,8,9,11] => [14,13,8,9,11]
  - [4,5] => [4]
  - [5,8,8,11,5,1,12,16] => [5,8,11,5,1,12,16]
- k=3
  - [14,6,3,0,16,13,0,7] => [14,6,0,16,13,0,7]
  - [16,1,15,8,10] => [16,1,8,10]
  - [11,16,7,14,16,15,8] => [11,16,14,16,15,8]


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
  - [15,11,11,5,15,16,2] => [15,11,11,5,15]
  - [18,8,18,16] => []
  - [2] => []
- k=3
  - [16,8,14,24,9,13,21] => [16,8,14,13]
  - [8,13,8,10,4,8,1] => [8,13,8,10,4,8,1]
  - [13,6,27,11,0,11,6] => [13,11,11]
- k=5
  - [40] => []
  - [9,12,16,16,9,7] => [9,12,16,16,9,7]
  - [] => []


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [3,1,1,11] => [3,2,2,11]
  - [6,12,0,2] => [6,12,0,2]
  - [11,0,11] => [11,0,11]
- k=2, n=10
  - [14,0,16,12,12,13] => [14,0,16,12,12,13]
  - [5,13] => [5,13]
  - [4] => [4]
- k=3, n=-2
  - [3,3,3] => [-2,-2,-2]
  - [3,4,3,3,3,3] => [-2,4,-2,-2,-2,-2]
  - [5,5] => [5,5]
- k=5, n=0
  - [13,5,12,1] => [13,0,12,1]
  - [13,10,7] => [13,10,7]
  - [5,5,9,5] => [0,0,9,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [16,16,16,6,1,2] => [16,16,16,16,16,16]
  - [11,14,7] => [11,11,11]
  - [5,5] => [5,5]
- k=2
  - [14,16,14,6,5,11,2] => [16,16,16,16,16,16,16]
  - [10,10,3,1,2,10,1,0,8] => [10,10,10,10,10,10,10,10,10]
  - [0,12,8,10] => [12,12,12,12]
- k=3
  - [3,5,10,5,0,4,16,9,10] => [10,10,10,10,10,10,10,10,10]
  - [12,6,9,2,3] => [9,9,9,9,9]
  - [15,14,8,0,12,11] => [8,8,8,8,8,8]
- k=5
  - [10,13,4,15,3,8,16] => [3,3,3,3,3,3,3]
  - [3,4,14,16,7,7,15] => [7,7,7,7,7,7,7]
  - [7,13,10,15,8,14,2,14,2,5] => [8,8,8,8,8,8,8,8,8,8]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [2,3] => [2,3]
  - [16,12,3,16] => [2,12,3,16]
  - [1,9,8,12,10] => [2,9,8,12,10]
- k=2, n=10
  - [8,0,14,10] => [8,10,14,10]
  - [8,1,12,14,10,8,3] => [8,10,12,14,10,8,3]
  - [6,6,8,3,3,15] => [6,10,8,3,3,15]
- k=3, n=-2
  - [16,9,9,3,11,12,5,1] => [16,9,-2,3,11,12,5,1]
  - [12,6,15,5,8] => [12,6,-2,5,8]
  - [13,11,9,16,10,4,8,2] => [13,11,-2,16,10,4,8,2]
- k=5, n=0
  - [15,0,8,1,8,5,2,7,4] => [15,0,8,1,0,5,2,7,4]
  - [12,15,4,6,1,13] => [12,15,4,6,0,13]
  - [14,15,5,14,16,15,9,8,11,2,15] => [14,15,5,14,0,15,9,8,11,2,15]


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
  - [4,13,5,13,7,12] => [13,5,13,7,12,4]
  - [] => []
  - [11,11,11,12,0,15] => [11,11,12,0,15,11]
- k=3
  - [6,16,8,10,15,5,0] => [10,15,5,0,6,16,8]
  - [13,9] => [9,13]
  - [] => []
- k=-2
  - [11,5] => [11,5]
  - [9,3] => [9,3]
  - [10,4,0,3,9,14] => [9,14,10,4,0,3]
- k=10
  - [9,5,8,5,14] => [9,5,8,5,14]
  - [14,13,6,13] => [6,13,14,13]
  - [11,16,16,0,13,4,1] => [0,13,4,1,11,16,16]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [7,16,1,6,15] => [16,1]
  - [6,0,15,15,7,16,1,12,7] => [0,15]
  - [9,4,16,14,0,15,2,14] => [4,16]
- k=2, n=3
  - [4,14,9,7,7,6,5] => [14,9,7]
  - [11,6,4,10,4,5,16,10,9,14] => [6,4,10]
  - [1,13,11,3,9,5] => [13,11,3]
- k=3, n=3
  - [1,15,12,4,12,5,16,13,2,16,11,7] => [12,4,12]
  - [13,0,8,5,6,12,5,11,4] => [8,5,6]
  - [6,14,8,8,7,6,10,15,16,5,8,14] => [8,8,7]
- k=3, n=4
  - [7,12,1,13,5,14,14,5,0,13,0] => [1,13,5,14]
  - [14,2,7,3,8,0,13,12] => [7,3,8,0]
  - [3,12,8,0,14,13,4,4,14,15,11,15,0] => [8,0,14,13]


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
  - [0,2,11,14,2,11,13,0] => [0,2]
  - [13,11,14,1,11] => [13,11]
  - [2,13,14,2,2] => [2,13]
- k=3
  - [2,0,7,16,8,0,7,9,3] => [2,0,7]
  - [7,14,3] => [7,14,3]
  - [2,16,11,15,11,1] => [2,16,11]
- k=5
  - [7,14,11,4,13,1,3,12,1] => [7,14,11,4,13]
  - [2,4,11,0,2,12,1,7,15,8] => [2,4,11,0,2]
  - [12,9,6,7,10,14,16,16] => [12,9,6,7,10]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




