# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [4,2] => [6,4]
  - [] => []
  - [5,6,13] => [7,8,15]
- k=3
  - [8,2,16,14,11,7] => [11,5,19,17,14,10]
  - [4,8,1,5,6] => [7,11,4,8,9]
  - [13,7,14,6] => [16,10,17,9]
- k=-2
  - [0,2,2] => [-2,0,0]
  - [8,2,2,6,13,13,7] => [6,0,0,4,11,11,5]
  - [5,5,2,4] => [3,3,0,2]
- k=10
  - [3,9] => [13,19]
  - [6] => [16]
  - [7,6,2,9,1] => [17,16,12,19,11]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [11,1] => [11,1,2]
  - [5] => [5,2]
  - [5,6,9,0,9] => [5,6,9,0,9,2]
- k=3
  - [2,13] => [2,13,3]
  - [11,15] => [11,15,3]
  - [0,2,9,9,1] => [0,2,9,9,1,3]
- k=-2
  - [5,1,4,5,10] => [5,1,4,5,10,-2]
  - [13,12,15,9] => [13,12,15,9,-2]
  - [11,10] => [11,10,-2]
- k=10
  - [9,7] => [9,7,10]
  - [7] => [7,10]
  - [14,8,4,0,11] => [14,8,4,0,11,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [6,14,2,2,16,4] => [1,2,4,4,4,6]
  - [8,7,2,2,10,9] => [3,2,4,4,5,4]
  - [0,16,16,14,9,1,6] => [2,4,4,2,4,3,1]
- k=1, n=10
  - [1,11,1,11,9,15] => [2,2,2,2,0,6]
  - [2] => [3]
  - [13,1,3] => [4,2,4]
- k=10, n=26
  - [8,8,8,4,2,7,15] => [18,18,18,14,12,17,25]
  - [2,6] => [12,16]
  - [6,4,3,15,9] => [16,14,13,25,19]
- k=13, n=26
  - [4] => [17]
  - [16,8,14,14] => [3,21,1,1]
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
- [head](#head-parametric)
- [tail](#tail-parametric)
- [count-k](#count-k-parametric)

### count-k (parametric)

`count-k` counts occurrences of the number `k`.

Examples:
- k=2
  - [0,12,8,8,10] => 0
  - [8] => 0
  - [0] => 0
- k=3
  - [3,13,7] => 1
  - [9,1,13,8] => 0
  - [10,5,6,13,1,8] => 0
- k=10
  - [0,1,2,5] => 0
  - [3,10,12,10,3] => 2
  - [13,15,12,4] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [9,4,3,11,14,12,10,14,10] => [3,11,14,12,10,14,10]
  - [5,15] => []
  - [10,11,13,7,10,3,14] => [13,7,10,3,14]
- k=3
  - [8,14,8,5,1,10,14,16,14] => [5,1,10,14,16,14]
  - [8,2,6,3,0,4,2] => [3,0,4,2]
  - [16,14,1,7,13,6,10,12,5] => [7,13,6,10,12,5]
- k=5
  - [7,0,14,3,6,12,7,8,15] => [12,7,8,15]
  - [13,7,3,7,11,9] => [9]
  - [4,1,12,8,4,12] => [12]




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
  - [2,11,5] => true
  - [9,2] => true
  - [9,5,6,2,14] => true
- k=3
  - [12,15,5,13,9,1,3,6] => true
  - [3] => true
  - [2,12,3,8,2,3,3] => true
- k=10
  - [14,10,16] => true
  - [14,7,5,16,6,5,0] => false
  - [0,14,8,13,11,10,15,9] => true




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
  - [6,1,11,9] => 1
  - [2,3,16,1,3,10,10,3] => 3
  - [0,7,5,7,16] => 7
- k=3
  - [1,1,16,2] => 16
  - [1,14,1,9] => 1
  - [14,0,2,8,10,6,3,14] => 2


Conceptual dependencies:
- [head](#head-parametric)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [6,3,15,3,9,3,12] => [6,1,3,1,15,1,3,1,9,1,3,1,12]
  - [2,2,16] => [2,1,2,1,16]
  - [] => []
- k=10
  - [8,3,11,9,6,2,14] => [8,10,3,10,11,10,9,10,6,10,2,10,14]
  - [13,16,1,8] => [13,10,16,10,1,10,8]
  - [12,6,3,9,8] => [12,10,6,10,3,10,9,10,8]
- k=-2
  - [11] => [11]
  - [4,16,16,14,12,11,5] => [4,-2,16,-2,16,-2,14,-2,12,-2,11,-2,5]
  - [4,8,10,0,14,1] => [4,-2,8,-2,10,-2,0,-2,14,-2,1]
- k=0
  - [1,0,5,6,5,13,4] => [1,0,0,0,5,0,6,0,5,0,13,0,4]
  - [] => []
  - [1,4,8,11,1] => [1,0,4,0,8,0,11,0,1]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [16,22] => true
  - [10,6,26,20,10] => true
  - [20,10,26] => true
- k=3
  - [48,18] => true
  - [6,0,42] => true
  - [4,2] => false
- k=5
  - [30,30,20,60,25,40] => true
  - [4,4,3,0] => false
  - [45] => true


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
  - [6,4,16,4,5] => [6,4,16,4]
  - [3,4,4,6] => [4,4,6]
  - [4,8,14] => [4,8,14]
- k=3
  - [1] => []
  - [12,13,0,15,9,3,0] => [12,0,15,9,3,0]
  - [11,11,14,2,2,7,0] => [0]
- k=5
  - [0,0,13,14] => [0,0]
  - [] => []
  - [16] => []


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [12,16,4,4,2,10,9] => 12
  - [0,8,8,5,5] => 8
  - [3,13,8,5,1] => 8
- k=3
  - [15,6,14,14,2,15,14,7] => 14
  - [9,12,15,15,1,12,14,2,6,9] => 14
  - [4,12,0,1,16,2,12,16] => 12


Conceptual dependencies:
- [max](#max-parametric)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [0,5,11] => 5
  - [14,16,8,15,9,10,4,16] => 8
  - [14,16,7,4,9] => 7
- k=3
  - [15,0,5,2,4,0] => 2
  - [3,10,0,12,0] => 3
  - [7,9,1,3,2,3] => 3


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
  - [10,12,5,10,9] => [0,0,1,0,1]
  - [] => []
  - [12,7,6,2,15,10] => [0,1,0,0,1,0]
- k=3
  - [1,15,14,10,13,13,12] => [1,0,2,1,1,1,0]
  - [14] => [2]
  - [16,0,13,13] => [1,0,1,1]
- k=10
  - [16,9,1,14] => [6,9,1,4]
  - [14,15,4,2,0,16] => [4,5,4,2,0,6]
  - [] => []




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [7,14,14,9,14,15] => [14,28,28,18,28,30]
  - [1,10,3,6,10,7,9] => [2,20,6,12,20,14,18]
  - [15,10,13,2,6,10,16] => [30,20,26,4,12,20,32]
- k=3
  - [11,6,10,16,0] => [33,18,30,48,0]
  - [2,6,13,5] => [6,18,39,15]
  - [4,2,8,12,1,16] => [12,6,24,36,3,48]
- k=-2
  - [3,2] => [-6,-4]
  - [4,2,13,8,11,10] => [-8,-4,-26,-16,-22,-20]
  - [13,8,9,15,5,5] => [-26,-16,-18,-30,-10,-10]
- k=10
  - [7,12,15,0,7] => [70,120,150,0,70]
  - [3] => [30]
  - [12,3,15,3,10,15,10] => [120,30,150,30,100,150,100]




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
  - [10,5,3,1,10,6,15] => [2,10,5,3,1,10,6,15]
  - [] => [2]
  - [16,7,14,1,9] => [2,16,7,14,1,9]
- k=3
  - [7,7,3] => [3,7,7,3]
  - [1,15,7,6,8] => [3,1,15,7,6,8]
  - [] => [3]
- k=-2
  - [2,6,0] => [-2,2,6,0]
  - [0] => [-2,0]
  - [0,10] => [-2,0,10]
- k=10
  - [10,10,8,12,0,14,7] => [10,10,10,8,12,0,14,7]
  - [8,0] => [10,8,0]
  - [14,6,14] => [10,14,6,14]




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
  - [10,4,8,4,3,5,14,6,1] => [10,8,4,3,5,14,6,1]
  - [9,0,1,9,6,3,6,4,13] => [9,1,9,6,3,6,4,13]
  - [13,13] => [13]
- k=3
  - [15,1,12,16,6,2,13] => [15,1,16,6,2,13]
  - [15,16,0,2,5,9,1,6,14] => [15,16,2,5,9,1,6,14]
  - [4,2,9,12,4,7,4] => [4,2,12,4,7,4]


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
  - [3,7,6,12] => [3,7]
  - [5] => [5]
  - [1,5,0,2,6,10] => [1,5]
- k=3
  - [1,5] => [1,5]
  - [3,1,16,10,4,9] => [1,16,10,4]
  - [7,11,6,12] => [7,11]
- k=5
  - [7,15,8,14,15,13,3] => [7,8,14,13,3]
  - [1,0] => [1]
  - [1] => [1]


Conceptual dependencies:
- [evens](#evens-parametric)
- [odds](#odds-parametric)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [10] => [10]
  - [1,6,5] => [2,6,5]
  - [] => []
- k=2, n=10
  - [1,2,15,15,10,12,15] => [1,10,15,15,10,12,15]
  - [] => []
  - [3,13,8,2,4,15,4] => [3,13,8,10,4,15,4]
- k=3, n=-2
  - [4,5,0,8,5,13,15] => [4,5,0,8,5,13,15]
  - [4,6,4] => [4,6,4]
  - [14] => [14]
- k=5, n=0
  - [10,11,16,0,7,13] => [10,11,16,0,7,13]
  - [5,8,2,14,12] => [0,8,2,14,12]
  - [7,1,15] => [7,1,15]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [3,13,11,13,16] => [3,3,3,3,3]
  - [9] => [9]
  - [5,15,15,11] => [5,5,5,5]
- k=2
  - [13,4,4,13,16,5,6] => [4,4,4,4,4,4,4]
  - [7,5,0,10,8] => [5,5,5,5,5]
  - [4,13,13,2,5,6,15] => [13,13,13,13,13,13,13]
- k=3
  - [11,7,5,15,0,12,16,7] => [5,5,5,5,5,5,5,5]
  - [7,14,6,0,15,4,0,1,10] => [6,6,6,6,6,6,6,6,6]
  - [13,2,13,16,10,5,10,4,4,8] => [13,13,13,13,13,13,13,13,13,13]
- k=5
  - [8,3,14,2,10,0,1,2,11,12,1] => [10,10,10,10,10,10,10,10,10,10,10]
  - [0,8,2,12,13,9,10,7,0,15,5,6] => [13,13,13,13,13,13,13,13,13,13,13,13]
  - [3,16,16,6,9,14,10,15] => [9,9,9,9,9,9,9,9]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [16] => [2]
  - [3,1,6] => [2,1,6]
  - [13,15,2] => [2,15,2]
- k=2, n=10
  - [6,4,4] => [6,10,4]
  - [5,13,3,14,10,12] => [5,10,3,14,10,12]
  - [12,0,3,8,13] => [12,10,3,8,13]
- k=3, n=-2
  - [9,16,12,6] => [9,16,-2,6]
  - [13,2,5] => [13,2,-2]
  - [0,12,16] => [0,12,-2]
- k=5, n=0
  - [9,1,16,3,1,12,8] => [9,1,16,3,0,12,8]
  - [10,1,8,7,14,13,7,2] => [10,1,8,7,0,13,7,2]
  - [2,12,15,10,15] => [2,12,15,10,0]


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
  - [10] => [10]
  - [9] => [9]
  - [] => []
- k=3
  - [4] => [4]
  - [2,4,0,6] => [6,2,4,0]
  - [] => []
- k=-2
  - [12,14,10,2,2] => [2,2,12,14,10]
  - [5,4] => [5,4]
  - [10,15,15,7,14,0] => [14,0,10,15,15,7]
- k=10
  - [13,7,3,2] => [3,2,13,7]
  - [] => []
  - [7,14,7] => [14,7,7]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [12,1,12,1,10,4,2,2,2,3] => [1,12]
  - [12,9,12,14,16] => [9,12]
  - [1,15,4,11,7,5,16] => [15,4]
- k=2, n=3
  - [16,8,5,13,8,5,4,3,16,6] => [8,5,13]
  - [1,11,16,16,4,2,1,8,10] => [11,16,16]
  - [9,7,8,13,2,1,4,9] => [7,8,13]
- k=3, n=3
  - [1,6,6,4,5,5,11,11,15] => [6,4,5]
  - [14,14,3,5,4,6,14,7,1,11] => [3,5,4]
  - [15,14,4,10,0,0,5,2,12,11,12,15,4] => [4,10,0]
- k=3, n=4
  - [9,13,13,8,16,14,10,16,0,4] => [13,8,16,14]
  - [16,1,6,3,13,15,12,9,3,7,4,2,7,1] => [6,3,13,15]
  - [13,7,7,10,0,6,1,13,3,0,9,0,2] => [7,10,0,6]


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
  - [11,10] => [11,10]
  - [9,8,12,8,4,9] => [9,8]
  - [0,5,6,8] => [0,5]
- k=3
  - [7,9,10,8,10,4] => [7,9,10]
  - [9,5,8,6,13,4,10,7,16] => [9,5,8]
  - [7,4,11,13,13,11,1,8] => [7,4,11]
- k=5
  - [15,3,14,10,12,13,0,3,6,14] => [15,3,14,10,12]
  - [2,2,2,14,9,9,5] => [2,2,2,14,9]
  - [2,4,10,2,4,14,15,6,15,13] => [2,4,10,2,4]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




