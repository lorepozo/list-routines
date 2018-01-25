# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [] => []
  - [5,4] => [6,5]
  - [6,16,7,5,15,4] => [7,17,8,6,16,5]
- k=2
  - [12,7,8] => [14,9,10]
  - [11] => [13]
  - [4,2,2,15,5,11,11] => [6,4,4,17,7,13,13]
- k=3
  - [2,14] => [5,17]
  - [10,7,16,12,3,7] => [13,10,19,15,6,10]
  - [6,4,1,11,6,16,11] => [9,7,4,14,9,19,14]
- k=-2
  - [] => []
  - [4,14,2,9] => [2,12,0,7]
  - [10,2,10,2] => [8,0,8,0]
- k=10
  - [6,2,4,9,1] => [16,12,14,19,11]
  - [] => []
  - [] => []




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [5,8,10,4,10,15,16,11] => [5,8,10,4,10,15,16,11,8]
  - [6,5,12,2,7,2,11,5,12] => [6,5,12,2,7,2,11,5,12,5]
  - [4,12,8,12,6] => [4,12,8,12,6,12]
- k=3
  - [4,8,13,3,9,2,14,4,7,0] => [4,8,13,3,9,2,14,4,7,0,13]
  - [12,11,7,10,1,4,15] => [12,11,7,10,1,4,15,7]
  - [16,15,11,10,11,13,9,15,10] => [16,15,11,10,11,13,9,15,10,11]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,16,12,12] => [5,16,12,12,2]
  - [0,1,1,6,1] => [0,1,1,6,1,2]
  - [] => [2]
- k=3
  - [14,3,9,1,5,16] => [14,3,9,1,5,16,3]
  - [10,14,10] => [10,14,10,3]
  - [15,5,2] => [15,5,2,3]
- k=-2
  - [4,6,2,1,5,8] => [4,6,2,1,5,8,-2]
  - [12] => [12,-2]
  - [14,3,16] => [14,3,16,-2]
- k=10
  - [] => [10]
  - [3] => [3,10]
  - [2] => [2,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [6,3,4,6,1,5,3] => [1,5,6,1,3,0,5]
  - [6,4,5] => [1,6,0]
  - [2,0] => [4,2]
- k=1, n=10
  - [1,2] => [2,3]
  - [1,7] => [2,8]
  - [] => []
- k=10, n=26
  - [4,19] => [14,3]
  - [2,14,25,15,4] => [12,24,9,25,14]
  - [3,16,9,17,21] => [13,0,19,1,5]
- k=13, n=26
  - [13] => [0]
  - [4] => [17]
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
  - [2,13,2] => 2
  - [10,2,2,0,2,2] => 4
  - [2,2,2,6] => 3
- k=3
  - [10,12,6,16,1,15] => 0
  - [3,3,3,3,3,3,3] => 7
  - [3,3,13,3] => 3
- k=10
  - [0,15,16,15,11,16,16] => 0
  - [] => 0
  - [10,10] => 2




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [0,0,16,13,2,8,13,8,7] => [16,13,2,8,13,8,7]
  - [3,7,2,2] => [2,2]
  - [0,13,15,14,12,0,0,4] => [15,14,12,0,0,4]
- k=3
  - [9,6,4,7,5,4,0,2,4,10] => [7,5,4,0,2,4,10]
  - [14,1,3,13,14,4,9,9,14] => [13,14,4,9,9,14]
  - [4,10,2,15,0,12] => [15,0,12]
- k=5
  - [14,7,3,1,6,7] => [7]
  - [15,5,3,14,8,13] => [13]
  - [11,12,0,16,14,1,14,1,2] => [1,14,1,2]




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
  - [2,2,2,2,2] => true
  - [11,2,2,2] => true
- k=3
  - [3,3,3,3] => true
  - [3,2,3] => true
  - [3,3,5,3] => true
- k=10
  - [2,7,2,12] => false
  - [10,10,14] => true
  - [10,9,1,0,1,4] => true




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
  - [16,4,8,4] => 4
  - [15,6,9,16,3,16] => 6
  - [10,15,2,8,6] => 15
- k=3
  - [2,1,16,2,3,11] => 16
  - [5,13,7,10,5,6] => 7
  - [16,3,11,7,16,6,13,14,4] => 11


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [5,3,5,4,12,1,11] => [5,1,3,1,5,1,4,1,12,1,1,1,11]
  - [9,14,2,4,4,5,13] => [9,1,14,1,2,1,4,1,4,1,5,1,13]
  - [8,13,4,9,8,7] => [8,1,13,1,4,1,9,1,8,1,7]
- k=10
  - [4,0] => [4,10,0]
  - [12] => [12]
  - [9] => [9]
- k=-2
  - [9,14,7,5] => [9,-2,14,-2,7,-2,5]
  - [12,0,0] => [12,-2,0,-2,0]
  - [4,1,4] => [4,-2,1,-2,4]
- k=0
  - [5] => [5]
  - [13,5,2] => [13,0,5,0,2]
  - [4,4,13,12,5] => [4,0,4,0,13,0,12,0,5]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [7,16,12,4] => false
  - [12,0,16,20,2] => true
  - [0,4] => true
- k=3
  - [21,21,3,21,48,30] => true
  - [15,15,1,0,6] => false
  - [15,8] => false
- k=5
  - [55,10,75,0] => true
  - [25,50] => true
  - [50,30,20,10,75,40,45] => true


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
  - [11,4,10,2,9,15,0] => [4,10,2,0]
  - [2,16,0,12,6] => [2,16,0,12,6]
  - [2,14,14,11] => [2,14,14]
- k=3
  - [3,12,10,5,4,6] => [3,12,6]
  - [3] => [3]
  - [18,24,18] => [18,24,18]
- k=5
  - [11,0] => [0]
  - [] => []
  - [25,5] => [25,5]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [12,12,3,8,4,4,10] => 12
  - [10,10,13,11,6,6,15] => 13
  - [15,3,2] => 3
- k=3
  - [9,1,6,3,0,8,10] => 8
  - [4,10,10,6,6,7] => 7
  - [13,10,8,0] => 8


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [16,16,12,1,10,13,11] => 10
  - [16,2,2,3] => 2
  - [12,11] => 12
- k=3
  - [6,1,16,0,13,11,12,15,16] => 6
  - [7,13,13,15] => 13
  - [5,7,13,10] => 10


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
  - [14,13,9] => [0,1,1]
  - [4,6,14,6,3,3] => [0,0,0,0,1,1]
  - [12,1,5,6,12,14,16] => [0,1,1,0,0,0,0]
- k=3
  - [7,7,9,3,12] => [1,1,0,0,0]
  - [9,15] => [0,0]
  - [15,3,3,16,4,6,3] => [0,0,0,1,1,0,0]
- k=10
  - [10,9,13,4,5,15,16] => [0,9,3,4,5,5,6]
  - [9,2] => [9,2]
  - [11,15,10,2,14,10,9] => [1,5,0,2,4,0,9]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [] => []
  - [13,7,1,13] => [26,14,2,26]
  - [8,10,9,11,2,7,6] => [16,20,18,22,4,14,12]
- k=3
  - [3] => [9]
  - [2,5,12,0,3,10] => [6,15,36,0,9,30]
  - [3,12,9,14,6] => [9,36,27,42,18]
- k=-2
  - [13] => [-26]
  - [0] => [0]
  - [8,10,1] => [-16,-20,-2]
- k=10
  - [] => []
  - [] => []
  - [12,7,4,0,2] => [120,70,40,0,20]




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
  - [3,7,10,1,8] => [8,128,1024,2,256]
  - [] => []
  - [9,1,11,3,9,0,9] => [512,2,2048,8,512,1,512]
- k=3
  - [11,6,4,10,1,7,7] => [177147,729,81,59049,3,2187,2187]
  - [9,9,7,2,10,11,3] => [19683,19683,2187,9,59049,177147,27]
  - [3,2,7,9] => [27,9,2187,19683]
- k=4
  - [2,5,5] => [16,1024,1024]
  - [7,3,7] => [16384,64,16384]
  - [2,0] => [16,1]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [9,12,16] => [81,144,256]
  - [5,15,6,13,14,12] => [25,225,36,169,196,144]
  - [9,16] => [81,256]
- k=3
  - [3,14,0] => [27,2744,0]
  - [14,2,8,13,7] => [2744,8,512,2197,343]
  - [1,4,7,9,16,2] => [1,64,343,729,4096,8]
- k=4
  - [14,12,3,16] => [38416,20736,81,65536]
  - [8,14,8,2] => [4096,38416,4096,16]
  - [14,8] => [38416,4096]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [0,8,15,5,4] => [8,0,8,15,5,4]
  - [14,9,13,3,15,9,7] => [9,14,9,13,3,15,9,7]
  - [1,11,3] => [11,1,11,3]
- k=3
  - [16,15,5,14,12] => [5,16,15,5,14,12]
  - [13,4,13,5,12,1,5] => [13,13,4,13,5,12,1,5]
  - [1,16,11,1,14] => [11,1,16,11,1,14]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [12,16,5,2,2,5] => [2,12,16,5,2,2,5]
  - [11,2,7,13] => [2,11,2,7,13]
  - [2,10,5,9,1,9] => [2,2,10,5,9,1,9]
- k=3
  - [16] => [3,16]
  - [7,11] => [3,7,11]
  - [] => [3]
- k=-2
  - [7,5,10,6,16,15,11] => [-2,7,5,10,6,16,15,11]
  - [13,5] => [-2,13,5]
  - [1,16,14] => [-2,1,16,14]
- k=10
  - [10,5,16,14,9,7] => [10,10,5,16,14,9,7]
  - [2] => [10,2]
  - [3,13,4,3,0,16] => [10,3,13,4,3,0,16]




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
  - [8,10,10,5] => [8,10,5]
  - [10,11,9] => [10,9]
  - [5,11,4,13,3,15,2,16,1] => [5,4,13,3,15,2,16,1]
- k=3
  - [14,8,4,13,16,15,13] => [14,8,13,16,15,13]
  - [13,0,6,2,7,5,16,2] => [13,0,2,7,5,16,2]
  - [5,6,2] => [5,6]


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
  - [7,5,1,9,11] => [7,5,1,9,11]
  - [13,5,7,7,3,7,8] => [13,5,7,7,3,7]
- k=3
  - [16,16,10,3,6,0] => [16,16,10]
  - [7,6,4] => [7,4]
  - [8,6,2] => [8,2]
- k=5
  - [45,5,1,5,25,5,10] => [1]
  - [16,16] => [16,16]
  - [2,0,25,0] => [2]


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
  - [0] => [0,0]
  - [5,3,11,16,13] => [5,3,11,16,13,5,3,11,16,13]
  - [5,11,0] => [5,11,0,5,11,0]
- k=3
  - [] => []
  - [] => []
  - [9,5] => [9,5,9,5,9,5]
- k=5
  - [14,8,13] => [14,8,13,14,8,13,14,8,13,14,8,13,14,8,13]
  - [0,4] => [0,4,0,4,0,4,0,4,0,4]
  - [1,10,10,0] => [1,10,10,0,1,10,10,0,1,10,10,0,1,10,10,0,1,10,10,0]




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
  - [] => []
  - [1,1,1,1,11] => [2,2,2,2,11]
  - [5,6,4] => [5,6,4]
- k=2, n=10
  - [13] => [13]
  - [2,2,2] => [10,10,10]
  - [2,1,2,2] => [10,1,10,10]
- k=3, n=-2
  - [16,12,16] => [16,12,16]
  - [15] => [15]
  - [3,3,5] => [-2,-2,5]
- k=5, n=0
  - [13,5,5,5] => [13,0,0,0]
  - [5,5,5] => [0,0,0]
  - [7,13] => [7,13]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [1,12,14,16,11,1] => [1,1,1,1,1,1]
  - [6,12,4,6,14,4,14,3] => [6,6,6,6,6,6,6,6]
  - [8,8,0,1,13,12,15,12] => [8,8,8,8,8,8,8,8]
- k=2
  - [8,15,8,1,13,12,12,5,14] => [15,15,15,15,15,15,15,15,15]
  - [7,4] => [4,4]
  - [0,16,14,11] => [16,16,16,16]
- k=3
  - [8,6,16] => [16,16,16]
  - [7,6,3,7,9,10] => [3,3,3,3,3,3]
  - [13,0,16,6,7,13,9] => [16,16,16,16,16,16,16]
- k=5
  - [11,6,3,16,8] => [8,8,8,8,8]
  - [7,14,6,15,12,10,10,14,13,16,6,16] => [12,12,12,12,12,12,12,12,12,12,12,12]
  - [2,2,1,14,11,7,3,1,13,0,6,16] => [11,11,11,11,11,11,11,11,11,11,11,11]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [3,5,3,3,7,6] => [2,5,3,3,7,6]
  - [16,9,2,11,1,0,11,9] => [2,9,2,11,1,0,11,9]
  - [1,4,13,15,3] => [2,4,13,15,3]
- k=2, n=10
  - [7,1,11,1,12,16,14,11] => [7,10,11,1,12,16,14,11]
  - [16,10,3,9,6,1,3] => [16,10,3,9,6,1,3]
  - [15,7,16,13,3,7,9,16,5] => [15,10,16,13,3,7,9,16,5]
- k=3, n=-2
  - [8,6,2,0,7,3,11] => [8,6,-2,0,7,3,11]
  - [1,11,3,9,10,11,14,0,4,15] => [1,11,-2,9,10,11,14,0,4,15]
  - [3,13,4,9,5,3,4] => [3,13,-2,9,5,3,4]
- k=5, n=0
  - [5,10,13,15,1,10,7,6,3,14] => [5,10,13,15,0,10,7,6,3,14]
  - [1,8,8,6,0,3,8,2,15] => [1,8,8,6,0,3,8,2,15]
  - [15,10,8,4,14,1,15] => [15,10,8,4,0,1,15]


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
  - [0,8,0,0] => [0,0,8,0]
  - [5,15,12] => [12,5,15]
  - [3,1,4,1,14] => [14,3,1,4,1]
- k=3
  - [15,3] => [3,15]
  - [4,10,16,16,16,8] => [16,16,8,4,10,16]
  - [7,13,1,15,15,3,7] => [15,3,7,7,13,1,15]
- k=-2
  - [14] => [14]
  - [0,15,15,13] => [15,13,0,15]
  - [4,12] => [4,12]
- k=10
  - [3] => [3]
  - [16,4,5,4,4,9,1] => [4,9,1,16,4,5,4]
  - [3,7,13] => [13,3,7]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [5,1,5,7,5,1,9,12,12,5,12,3] => [1,5]
  - [0,2,10,11,1] => [2,10]
  - [3,8,7,12,8,12,0,12,2,1,5,2] => [8,7]
- k=2, n=3
  - [3,10,3,15,5,6,6,12,10,6,8,4,2] => [10,3,15]
  - [16,6,12,7,0,5,7,14,15,7] => [6,12,7]
  - [4,2,2,2,15,10,5,7,3,10,5] => [2,2,2]
- k=3, n=3
  - [3,10,14,6,6,2,7,12,13,3,4] => [14,6,6]
  - [5,5,4,2,2,15,7,15,5,1] => [4,2,2]
  - [10,11,5,11,8,9,4,11,16,5,0,4,10] => [5,11,8]
- k=3, n=4
  - [11,5,13,15,0,14,15,11,6,11,6,12,14,9,6] => [13,15,0,14]
  - [9,15,16,9,9,5,4,14,11,6,5] => [16,9,9,5]
  - [2,5,10,16,13,4,12,9,1,6,13] => [10,16,13,4]


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
  - [14,10,1,3,16] => [14,10]
  - [14,7,14,11,7,1,5,14,1] => [14,7]
  - [13,6,7,5,16] => [13,6]
- k=3
  - [8,1,4,1] => [8,1,4]
  - [5,8,0] => [5,8,0]
  - [16,13,2] => [16,13,2]
- k=5
  - [16,7,1,9,1,13,15,10,6] => [16,7,1,9,1]
  - [5,6,6,4,2,15,0,6,1] => [5,6,6,4,2]
  - [12,1,13,11,1,0,8,2,8,13,8,11] => [12,1,13,11,1]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




