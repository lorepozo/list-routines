# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [] => []
  - [12,12,2,12,12,12,7] => [14,14,4,14,14,14,9]
  - [2,0,14,9,5] => [4,2,16,11,7]
- k=3
  - [5,11] => [8,14]
  - [11,9,8,1] => [14,12,11,4]
  - [13,3,5,13,7,1,3] => [16,6,8,16,10,4,6]
- k=-2
  - [11,1,9,3] => [9,-1,7,1]
  - [2,14,2,1,4,5] => [0,12,0,-1,2,3]
  - [0,15,13,15,9] => [-2,13,11,13,7]
- k=10
  - [12,5,1,10] => [22,15,11,20]
  - [2,1,12,6,4] => [12,11,22,16,14]
  - [0] => [10]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,14,9,10] => [5,14,9,10,2]
  - [1] => [1,2]
  - [2,1,14,4,4] => [2,1,14,4,4,2]
- k=3
  - [11,0] => [11,0,3]
  - [6,11,0,2,6,1,8] => [6,11,0,2,6,1,8,3]
  - [] => [3]
- k=-2
  - [4] => [4,-2]
  - [7,9,9,9,5,6,16] => [7,9,9,9,5,6,16,-2]
  - [11,1,10,1] => [11,1,10,1,-2]
- k=10
  - [7,3,4,7,4,16] => [7,3,4,7,4,16,10]
  - [14,4] => [14,4,10]
  - [2] => [2,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [5,4] => [0,6]
  - [1] => [3]
  - [] => []
- k=1, n=10
  - [4,6,9] => [5,7,0]
  - [0,7,5,1,8,3,6] => [1,8,6,2,9,4,7]
  - [6,8,9,2,7,0,2] => [7,9,0,3,8,1,3]
- k=10, n=26
  - [10,1,9,0] => [20,11,19,10]
  - [17,14,1,20,4,8] => [1,24,11,4,14,18]
  - [11,21,1,13] => [21,5,11,23]
- k=13, n=26
  - [17,8] => [4,21]
  - [22] => [9]
  - [21,9] => [8,22]


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
  - [4,2] => 1
  - [2,15,11,9,11,2] => 2
  - [2] => 1
- k=3
  - [6,2,10,1,2,14,3] => 1
  - [3,9,9,9] => 1
  - [13,3,3,3,3] => 4
- k=10
  - [10,6,10,10,13] => 3
  - [2,10,10] => 2
  - [4,11,16,15,1,13,7] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [13,10,6,7] => [6,7]
  - [11,6,5] => [5]
  - [12,6,10,13,12,8] => [10,13,12,8]
- k=3
  - [3,4,8,3] => [3]
  - [5,0,6,7,4,16,4,0] => [7,4,16,4,0]
  - [3,4,2,9,14,15,15] => [9,14,15,15]
- k=5
  - [7,15,7,2,6] => []
  - [2,1,13,14,15,8,9] => [8,9]
  - [4,6,11,10,14,2,11,0,1,13,10,9] => [2,11,0,1,13,10,9]




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
  - [10,13,2,8] => true
  - [8,14,14,9,2] => true
  - [15,8,3,4,5,13] => false
- k=3
  - [13,3,3,6,11,3,3] => true
  - [3,6,15] => true
  - [5,6,4,12] => false
- k=10
  - [] => false
  - [10] => true
  - [10,13,16] => true




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
  - [0,0,5,5,5,6,3] => 0
  - [12,1,13,5,15,5,16,15] => 1
  - [0,0,7,4,12,11,8,14] => 0
- k=3
  - [4,8,5] => 5
  - [10,9,12,0,7,12,3,5] => 12
  - [10,8,11,12,7,10] => 11


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [2,6] => [2,1,6]
  - [16,2,8,10,6,12] => [16,1,2,1,8,1,10,1,6,1,12]
- k=10
  - [10] => [10]
  - [10,16,12,6,1] => [10,10,16,10,12,10,6,10,1]
  - [10,4,6,5,16] => [10,10,4,10,6,10,5,10,16]
- k=-2
  - [0,8,7,9,14] => [0,-2,8,-2,7,-2,9,-2,14]
  - [1,5,1,8,9,15,8] => [1,-2,5,-2,1,-2,8,-2,9,-2,15,-2,8]
  - [8,12,13] => [8,-2,12,-2,13]
- k=0
  - [7,4,2,12,7] => [7,0,4,0,2,0,12,0,7]
  - [0,12,13,2,12,14] => [0,0,12,0,13,0,2,0,12,0,14]
  - [11,12,9,3] => [11,0,12,0,9,0,3]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [16,0,16,12,8,18,4] => true
  - [3,11,1] => false
  - [16,7,12,10,14] => false
- k=3
  - [8,1,8,14,6,15,8] => false
  - [0,9,13,16,14,7] => false
  - [24,6,18,15,21,39] => true
- k=5
  - [16,11,7,11,14,13] => false
  - [11,8,7,9,1,3,0] => false
  - [70,10,25,10,60,55] => true


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
  - [5,1,7,4] => [4]
  - [14] => [14]
  - [14,1] => [14]
- k=3
  - [1,2,16,8,4] => []
  - [13,6,5,14,10,7,9] => [6,9]
  - [15,6] => [15,6]
- k=5
  - [0,40,15,20,15] => [0,40,15,20,15]
  - [35,10,13,8] => [35,10]
  - [8,10] => [10]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [16,5,7,14,6,2,1] => 14
  - [14,4,0,3,6] => 6
  - [3,3] => 3
- k=3
  - [15,15,12,5] => 12
  - [12,8,14,1] => 8
  - [2,13,12,12,0] => 12


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [7,12,15,0,5,10,1] => 1
  - [1,8,8,5,11,15,1] => 1
  - [0,12,10,14,16,2,0,13,8] => 0
- k=3
  - [13,5,5,1,7,9,14,5,10] => 5
  - [14,9,8,0,2] => 8
  - [14,9,2,15,13] => 13


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
  - [9,3,0,6,7,10,13] => [1,1,0,0,1,0,1]
  - [7] => [1]
  - [13,10,4,15,5,3] => [1,0,0,1,1,1]
- k=3
  - [8,13,8,6,15,8] => [2,1,2,0,0,2]
  - [16] => [1]
  - [14,14] => [2,2]
- k=10
  - [3,8,5] => [3,8,5]
  - [6,14,0,16,1,1] => [6,4,0,6,1,1]
  - [3,11,6,13,12,10] => [3,1,6,3,2,0]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [5,9] => [10,18]
  - [14,8] => [28,16]
  - [15] => [30]
- k=3
  - [10,12,12,1] => [30,36,36,3]
  - [13,10,7,12,10] => [39,30,21,36,30]
  - [2,8,11,3] => [6,24,33,9]
- k=-2
  - [16,11] => [-32,-22]
  - [3] => [-6]
  - [6,6,11,5] => [-12,-12,-22,-10]
- k=10
  - [10,10,2,1,14,8] => [100,100,20,10,140,80]
  - [1,13,0,0,14,11] => [10,130,0,0,140,110]
  - [14,3] => [140,30]




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
  - [7,7,6] => [128,128,64]
  - [4,9,10] => [16,512,1024]
  - [11,9,1] => [2048,512,2]
- k=3
  - [1,0] => [3,1]
  - [9,4,2,1] => [19683,81,9,3]
  - [2,2] => [9,9]
- k=4
  - [3,10] => [64,1048576]
  - [10,9,11] => [1048576,262144,4194304]
  - [10,1] => [1048576,4]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [5,7,16,8,0,5,1] => [25,49,256,64,0,25,1]
  - [14,13,2,16,9] => [196,169,4,256,81]
  - [8,10,13] => [64,100,169]
- k=3
  - [7,16,8,5,0,7,6] => [343,4096,512,125,0,343,216]
  - [3,1,2,14,4,5,12] => [27,1,8,2744,64,125,1728]
  - [2,8] => [8,512]
- k=4
  - [] => []
  - [0,11,4,3,13] => [0,14641,256,81,28561]
  - [0] => [0]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [2,11] => [2,2,11]
  - [13] => [2,13]
  - [0,3,4,13] => [2,0,3,4,13]
- k=3
  - [4,3,8,4,6,12] => [3,4,3,8,4,6,12]
  - [0,7,1,4,0] => [3,0,7,1,4,0]
  - [11,2] => [3,11,2]
- k=-2
  - [] => [-2]
  - [3,8,15,2,1] => [-2,3,8,15,2,1]
  - [1,9,0,8,2] => [-2,1,9,0,8,2]
- k=10
  - [11,9,5,4] => [10,11,9,5,4]
  - [11] => [10,11]
  - [14,12,9,10,9,6,12] => [10,14,12,9,10,9,6,12]




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
  - [9,13,3,11,13,16,9,6] => [9,3,11,13,16,9,6]
  - [14,16] => [14]
  - [8,3,0,0,9] => [8,0,0,9]
- k=3
  - [3,5,13,13] => [3,5,13]
  - [3,0,13,11,1,7,11] => [3,0,11,1,7,11]
  - [4,6,12,7,2,16,7,16,9,15] => [4,6,7,2,16,7,16,9,15]


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
  - [1] => [1]
  - [9,10,5,15,14,2,9] => [9,5,15,9]
  - [6,8,13,4,6] => [13]
- k=3
  - [9] => []
  - [15,8,2,16,11,3,4] => [8,2,16,11,4]
  - [18] => []
- k=5
  - [2,2,2,14] => [2,2,2,14]
  - [16,11,15,16,11,13] => [16,11,16,11,13]
  - [10,6,10] => [6]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [] => []
  - [1,3,1,1] => [2,3,2,2]
  - [1,1,10,1,14,1,1] => [2,2,10,2,14,2,2]
- k=2, n=10
  - [] => []
  - [2,2,2,2,5,2] => [10,10,10,10,5,10]
  - [7,2] => [7,10]
- k=3, n=-2
  - [5,6,3] => [5,6,-2]
  - [16,6,0,10] => [16,6,0,10]
  - [] => []
- k=5, n=0
  - [5,5,14,5,5,4] => [0,0,14,0,0,4]
  - [] => []
  - [5,10,5,9,5] => [0,10,0,9,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [7,10,14,3,12,15,4] => [7,7,7,7,7,7,7]
  - [16] => [16]
  - [13,3,5,1,0] => [13,13,13,13,13]
- k=2
  - [12,6,9,11,11,14] => [6,6,6,6,6,6]
  - [0,13] => [13,13]
  - [2,3,7,8,14] => [3,3,3,3,3]
- k=3
  - [13,5,1,14,1,7,9,12,11] => [1,1,1,1,1,1,1,1,1]
  - [10,7,6,8,12,4] => [6,6,6,6,6,6]
  - [13,14,3,15,1,6,11,10] => [3,3,3,3,3,3,3,3]
- k=5
  - [10,1,7,7,10] => [10,10,10,10,10]
  - [0,14,14,0,4,2] => [4,4,4,4,4,4]
  - [2,13,2,15,3,5,7,4,5,0,1] => [3,3,3,3,3,3,3,3,3,3,3]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [9,2,5,11,15] => [2,2,5,11,15]
  - [15,9] => [2,9]
  - [9,13,4,11] => [2,13,4,11]
- k=2, n=10
  - [1,4,11,5,10,4,4,8,1] => [1,10,11,5,10,4,4,8,1]
  - [15,11,5,11,4,14,3,6] => [15,10,5,11,4,14,3,6]
  - [8,0] => [8,10]
- k=3, n=-2
  - [10,16,15,8,1,0,12] => [10,16,-2,8,1,0,12]
  - [6,11,6,10,15,2,6,6,11] => [6,11,-2,10,15,2,6,6,11]
  - [6,4,2] => [6,4,-2]
- k=5, n=0
  - [15,10,9,3,13,11,7,10,8,1,10,3] => [15,10,9,3,0,11,7,10,8,1,10,3]
  - [12,0,0,3,12,2] => [12,0,0,3,0,2]
  - [9,12,3,3,0,13,9,6] => [9,12,3,3,0,13,9,6]


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
  - [] => []
  - [5] => [5]
  - [11,12,16,14,8,6,0] => [0,11,12,16,14,8,6]
- k=3
  - [16] => [16]
  - [2] => [2]
  - [6,10,7,9,14,7,6] => [14,7,6,6,10,7,9]
- k=-2
  - [] => []
  - [6,6,9,2,0] => [9,2,0,6,6]
  - [5,11,12] => [12,5,11]
- k=10
  - [7,13,3] => [3,7,13]
  - [4,8,10,1,7,2] => [10,1,7,2,4,8]
  - [16,7,10,4,7,6,15] => [7,6,15,16,7,10,4]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [8,1,10,12,7,8,3,14] => [1,10]
  - [1,7,13,11,9,5,3,8,9,3,11,15] => [7,13]
  - [8,9,15,7,3,15,7,2] => [9,15]
- k=2, n=3
  - [15,5,5,10,11,0,2] => [5,5,10]
  - [2,7,13,15,1,16,6,7,1] => [7,13,15]
  - [1,9,10,3,0,8,7,4,13] => [9,10,3]
- k=3, n=3
  - [6,8,11,9,10,4,0,3,15,10,6,14,1] => [11,9,10]
  - [3,8,6,0,10,4,9,16] => [6,0,10]
  - [11,8,2,6,6,0,2,14,15,5,13,13,4,16] => [2,6,6]
- k=3, n=4
  - [5,11,13,15,13,9,13,6,13,13,3] => [13,15,13,9]
  - [6,7,14,9,2,4,12,14,10,8,0] => [14,9,2,4]
  - [15,8,1,9,10,2,6,5] => [1,9,10,2]


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
  - [11,4,15,11,10] => [11,4]
  - [3,3,10,12,3] => [3,3]
  - [5,2,6,13,9,1] => [5,2]
- k=3
  - [12,5,1,1,7,15] => [12,5,1]
  - [7,1,14,0,14] => [7,1,14]
  - [6,11,0,12,3,7] => [6,11,0]
- k=5
  - [1,2,8,16,8] => [1,2,8,16,8]
  - [2,1,2,12,5] => [2,1,2,12,5]
  - [14,10,2,10,12,10,12,13,16,4,12,8] => [14,10,2,10,12]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




