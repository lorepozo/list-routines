# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [] => []
  - [16] => [18]
  - [13,10,13,3,9] => [15,12,15,5,11]
- k=3
  - [] => []
  - [12,0,13,12,10,16] => [15,3,16,15,13,19]
  - [12,16,8,2] => [15,19,11,5]
- k=-2
  - [11,3,14,7,2] => [9,1,12,5,0]
  - [5,9,14,7] => [3,7,12,5]
  - [3] => [1]
- k=10
  - [0] => [10]
  - [1,16,9] => [11,26,19]
  - [12,15] => [22,25]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [] => [2]
  - [2,14,13,16,16,15] => [2,14,13,16,16,15,2]
  - [1] => [1,2]
- k=3
  - [7,14,11,12,8] => [7,14,11,12,8,3]
  - [] => [3]
  - [8,8,9,1,16,12] => [8,8,9,1,16,12,3]
- k=-2
  - [6] => [6,-2]
  - [6] => [6,-2]
  - [3,5,13,10] => [3,5,13,10,-2]
- k=10
  - [] => [10]
  - [13,14,4,9,11,5,6] => [13,14,4,9,11,5,6,10]
  - [3,9,12,9,7] => [3,9,12,9,7,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [13,9,7,6] => [1,4,2,1]
  - [14,13,0,9,9,8] => [2,1,2,4,4,3]
  - [11,13,14,14,1,5,2] => [6,1,2,2,3,0,4]
- k=1, n=10
  - [12] => [3]
  - [1,16,5,2,0] => [2,7,6,3,1]
  - [3,12,9,13] => [4,3,0,4]
- k=10, n=26
  - [16,6,6] => [0,16,16]
  - [16,0] => [0,10]
  - [5] => [15]
- k=13, n=26
  - [8,6,14] => [21,19,1]
  - [] => []
  - [8,15,1,1,2] => [21,2,14,14,15]


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
  - [16,12,2,12] => 1
  - [2] => 1
  - [15,5,1] => 0
- k=3
  - [8] => 0
  - [] => 0
  - [13,13,9,3] => 1
- k=10
  - [12,4] => 0
  - [0,4,11,16] => 0
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
  - [2,13,12,10,7,7] => [12,10,7,7]
  - [5,2] => []
  - [15,15] => []
- k=3
  - [10,8,5,7,2,2,1,2,13,9] => [7,2,2,1,2,13,9]
  - [14,15,10,4,0,16] => [4,0,16]
  - [2,14,1,9] => [9]
- k=5
  - [7,8,2,13,9,10,9,0] => [10,9,0]
  - [3,16,5,6,10,2,13,3,9,8] => [2,13,3,9,8]
  - [0,2,8,13,2,5,1,7,1,13,6] => [5,1,7,1,13,6]




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
  - [2,12,1] => true
  - [14,11,14] => false
  - [0,3,8,1,8,11,2] => true
- k=3
  - [] => false
  - [4,9,3,4,13,1,15,8] => true
  - [3,15,8,16] => true
- k=10
  - [5,3,10] => true
  - [15] => false
  - [] => false




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
  - [5,9] => 9
  - [0,14,13,2] => 14
  - [1,13,1,16,2] => 13
- k=3
  - [6,16,16,16,8,10,0,9] => 16
  - [12,2,2,1,11,8,11,8,15,0] => 2
  - [5,9,13,7,5,6,2,10,0] => 13


Conceptual dependencies:
- [head](#head-parametric)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [16,8,5,14] => [16,1,8,1,5,1,14]
  - [6,4,15,8,4,6] => [6,1,4,1,15,1,8,1,4,1,6]
  - [14,13,8,0,6,15] => [14,1,13,1,8,1,0,1,6,1,15]
- k=10
  - [0,1] => [0,10,1]
  - [3] => [3]
  - [5,12,9,13] => [5,10,12,10,9,10,13]
- k=-2
  - [9,10,15] => [9,-2,10,-2,15]
  - [] => []
  - [16,8,12,12,6] => [16,-2,8,-2,12,-2,12,-2,6]
- k=0
  - [6,13] => [6,0,13]
  - [7,5,11,3,14,0,4] => [7,0,5,0,11,0,3,0,14,0,0,0,4]
  - [0,9,8,10,1,13] => [0,0,9,0,8,0,10,0,1,0,13]




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
  - [16,15,0,1,8,7] => false
  - [2,4,5] => false
- k=3
  - [30] => true
  - [11,10,12,14] => false
  - [12,6,0,2,9,15] => false
- k=5
  - [10,9,14] => false
  - [16,11,5,7,14] => false
  - [35,10] => true


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
  - [11,1,0,14] => [0,14]
  - [0,15,2] => [0,2]
  - [8,11,6,14,12] => [8,6,14,12]
- k=3
  - [2,8,27,0,6] => [27,0,6]
  - [13,15,15,5,1,3] => [15,15,3]
  - [12,2,11,0,10,16] => [12,0]
- k=5
  - [16,4,10,30,13,6,1] => [10,30]
  - [16,9,9,16,6] => []
  - [15,14,16,11,4] => [15]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [6,14,0] => 6
  - [11,6,6,6] => 6
  - [5,4] => 4
- k=3
  - [14,3,6,16,1,2,1,7,0,0] => 7
  - [3,15,11,10,11,15,6] => 11
  - [12,4,9,9] => 9


Conceptual dependencies:
- [max](#max-parametric)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [2,15] => 15
  - [2,1,8,14,0,7,9,16,0] => 0
  - [15,14,13,13] => 13
- k=3
  - [6,16,1,14] => 14
  - [6,7,6,7] => 7
  - [7,13,2] => 13


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
  - [2,15,4] => [0,1,0]
  - [] => []
  - [5,16,1] => [1,0,1]
- k=3
  - [11,0,9] => [2,0,0]
  - [12,11] => [0,2]
  - [] => []
- k=10
  - [8,6,5,7] => [8,6,5,7]
  - [11,13,9] => [1,3,9]
  - [10] => [0]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [] => []
  - [13,4,8,5,5,16] => [26,8,16,10,10,32]
  - [8,15,4,14,7,2,13] => [16,30,8,28,14,4,26]
- k=3
  - [10] => [30]
  - [12,4,11,7,5] => [36,12,33,21,15]
  - [16,8,5,7,8,13,5] => [48,24,15,21,24,39,15]
- k=-2
  - [6,14] => [-12,-28]
  - [2,4,2,10,0,0,2] => [-4,-8,-4,-20,0,0,-4]
  - [14,15] => [-28,-30]
- k=10
  - [10] => [100]
  - [16] => [160]
  - [1,4,0,11,13,6] => [10,40,0,110,130,60]




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
  - [11,13,14] => [2,11,13,14]
  - [4,16,11,10] => [2,4,16,11,10]
  - [16,3] => [2,16,3]
- k=3
  - [15] => [3,15]
  - [13,5,14,5] => [3,13,5,14,5]
  - [0,1,3,3,11,15] => [3,0,1,3,3,11,15]
- k=-2
  - [0,8,15,6,8,5] => [-2,0,8,15,6,8,5]
  - [2,10] => [-2,2,10]
  - [0] => [-2,0]
- k=10
  - [8,14,15,13,6,0] => [10,8,14,15,13,6,0]
  - [] => [10]
  - [9,16,9,7,1] => [10,9,16,9,7,1]




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
  - [16,8,14,6,5] => [16,14,6,5]
  - [10,1,13] => [10,13]
  - [5,0,3,3] => [5,3,3]
- k=3
  - [0,0,15] => [0,0]
  - [13,5,2,13,14,13,3] => [13,5,13,14,13,3]
  - [11,14,12,5,6,13,9,15] => [11,14,5,6,13,9,15]


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
  - [2,10,14,14,10,15,4] => [15]
  - [11,15] => [11,15]
  - [0,2,8,4] => []
- k=3
  - [4,16,4,10,2,11,7] => [4,16,4,10,2,11,7]
  - [8] => [8]
  - [14,10,10,2] => [14,10,10,2]
- k=5
  - [1,11] => [1,11]
  - [0,14,4,7,16,5] => [14,4,7,16]
  - [9,0,9,16,5,15,30] => [9,9,16]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [8,14,16,9,9,12] => [8,14,16,9,9,12]
  - [1,6,6,4,0] => [2,6,6,4,0]
  - [12,13,1,8,7,16] => [12,13,2,8,7,16]
- k=2, n=10
  - [16,7,10,4] => [16,7,10,4]
  - [0,2,16,11,10,1] => [0,10,16,11,10,1]
  - [7,3,9] => [7,3,9]
- k=3, n=-2
  - [16,13,6,3] => [16,13,6,-2]
  - [16,3,1,12] => [16,-2,1,12]
  - [13,10,3,14,11,0,12] => [13,10,-2,14,11,0,12]
- k=5, n=0
  - [] => []
  - [5,14,5,7,12,9] => [0,14,0,7,12,9]
  - [9,5] => [9,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [5,15,9,12,8,3,14] => [5,5,5,5,5,5,5]
  - [7,11,11,4,15,1,14,7] => [7,7,7,7,7,7,7,7]
  - [12,5,10,8,8] => [12,12,12,12,12]
- k=2
  - [8,12,12,5] => [12,12,12,12]
  - [7,6] => [6,6]
  - [13,4,3,3,8,5] => [4,4,4,4,4,4]
- k=3
  - [15,2,6] => [6,6,6]
  - [1,16,14,3,12,13,15,12] => [14,14,14,14,14,14,14,14]
  - [1,12,7,13,5,13,9] => [7,7,7,7,7,7,7]
- k=5
  - [5,3,6,5,6,13,3,8,7] => [6,6,6,6,6,6,6,6,6]
  - [10,3,14,13,7,9,6,5,16,13,15,3] => [7,7,7,7,7,7,7,7,7,7,7,7]
  - [16,6,2,4,16,10,4] => [16,16,16,16,16,16,16]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [6,14,1] => [2,14,1]
  - [12,0,9,15] => [2,0,9,15]
  - [5,8,8,3,14,8,1] => [2,8,8,3,14,8,1]
- k=2, n=10
  - [9,15,15,2] => [9,10,15,2]
  - [11,16] => [11,10]
  - [10,11,13,12,13,2,2,14,8] => [10,10,13,12,13,2,2,14,8]
- k=3, n=-2
  - [9,8,9,7,15,13,2,2,9,7] => [9,8,-2,7,15,13,2,2,9,7]
  - [9,5,15,2] => [9,5,-2,2]
  - [10,6,5,14] => [10,6,-2,14]
- k=5, n=0
  - [4,16,13,0,10,0,1,9,5,10,3,15] => [4,16,13,0,0,0,1,9,5,10,3,15]
  - [2,0,12,2,2,8,4] => [2,0,12,2,0,8,4]
  - [0,10,0,4,5,11] => [0,10,0,4,0,11]


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
  - [9,13] => [13,9]
  - [8,7,14,2,3,4] => [7,14,2,3,4,8]
  - [6,10,3,2,6,8] => [10,3,2,6,8,6]
- k=3
  - [15,0,12,9,13,16] => [9,13,16,15,0,12]
  - [4] => [4]
  - [] => []
- k=-2
  - [11,6,12] => [6,12,11]
  - [14,6,3,16,15,16] => [15,16,14,6,3,16]
  - [9,13,15] => [13,15,9]
- k=10
  - [8,1,9,14,10,8] => [10,8,8,1,9,14]
  - [11,15,5] => [15,5,11]
  - [9,12,9] => [12,9,9]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [6,7,9,11,11,15,1,1,6,2] => [7,9]
  - [7,3,5,8,0] => [3,5]
  - [5,11,11,5,14] => [11,11]
- k=2, n=3
  - [16,4,11,12,12,11,3] => [4,11,12]
  - [5,16,13,10,1,9,3] => [16,13,10]
  - [3,10,16,13,11,15,3,2,16,15,1,15,16] => [10,16,13]
- k=3, n=3
  - [11,9,4,8,14,0,14,14,9,6,1,15] => [4,8,14]
  - [10,6,3,15,5,7,1,7,0,14] => [3,15,5]
  - [16,0,13,5,5,1,3,13,13,8,1,6,13] => [13,5,5]
- k=3, n=4
  - [1,14,14,6,16,4,8,3,11,15] => [14,6,16,4]
  - [4,7,3,12,16,2,6,14,10,0,7,5] => [3,12,16,2]
  - [16,11,8,9,8,4,11,2,10,6,1,3,12] => [8,9,8,4]


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
  - [4,16,11,2,14] => [4,16]
  - [0,7,8] => [0,7]
  - [15,4,8] => [15,4]
- k=3
  - [2,5,9] => [2,5,9]
  - [15,1,16,6,12,11,14,1,6,3] => [15,1,16]
  - [14,3,12,11,14] => [14,3,12]
- k=5
  - [0,3,9,1,14,10,7,10] => [0,3,9,1,14]
  - [9,10,9,3,14,1,11,16,11,8,16] => [9,10,9,3,14]
  - [7,12,4,10,2,14,14] => [7,12,4,10,2]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




