# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [9,2,11] => [11,4,13]
  - [1,8,10,1,3,2] => [3,10,12,3,5,4]
  - [15,11,6,8,11] => [17,13,8,10,13]
- k=3
  - [13] => [16]
  - [5] => [8]
  - [11,8,13] => [14,11,16]
- k=-2
  - [6,0,1,9] => [4,-2,-1,7]
  - [9,1,10,10,14,3] => [7,-1,8,8,12,1]
  - [1,8] => [-1,6]
- k=10
  - [4,8,8,5,1,13,13] => [14,18,18,15,11,23,23]
  - [5,8,11,4] => [15,18,21,14]
  - [10,8,6,9,13,13] => [20,18,16,19,23,23]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [5,3,1,12,1,4,2] => [5,3,1,12,1,4,2,2]
  - [] => [2]
  - [] => [2]
- k=3
  - [4,12,0,4] => [4,12,0,4,3]
  - [] => [3]
  - [14,3,5] => [14,3,5,3]
- k=-2
  - [7,0,1,2] => [7,0,1,2,-2]
  - [12,16,16,15,9,10,1] => [12,16,16,15,9,10,1,-2]
  - [5,7,8,9,2,7,5] => [5,7,8,9,2,7,5,-2]
- k=10
  - [] => [10]
  - [5,11,7,11] => [5,11,7,11,10]
  - [9,14,15] => [9,14,15,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [1] => [3]
  - [6,3,0] => [1,5,2]
  - [3,5,3,5,6,2] => [5,0,5,0,1,4]
- k=1, n=10
  - [2,3] => [3,4]
  - [2,0,5,0,6,4,5] => [3,1,6,1,7,5,6]
  - [6,6,4,8,7] => [7,7,5,9,8]
- k=10, n=26
  - [21] => [5]
  - [] => []
  - [7,14] => [17,24]
- k=13, n=26
  - [3,23] => [16,10]
  - [2,7,18,7,1,3,22] => [15,20,5,20,14,16,9]
  - [11,11,24,9] => [24,24,11,22]


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
  - [16] => 0
  - [15,14,1,1,1,15,3] => 0
  - [13,2,2,6,4,9] => 2
- k=3
  - [11,13,12,8,0,3,8] => 1
  - [0,15,7,12,16,13] => 0
  - [14,4,10,7] => 0
- k=10
  - [8,12,3,7] => 0
  - [15,10,6,10] => 2
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
  - [6,1,4,16,9,9,16,1,12] => [4,16,9,9,16,1,12]
  - [2,9,8,4,8,14,10,9,5] => [8,4,8,14,10,9,5]
  - [9,5,13,16,12,12] => [13,16,12,12]
- k=3
  - [12,13,0,13,13,2,0,9] => [13,13,2,0,9]
  - [9,12,6,6,14,7,3,11] => [6,14,7,3,11]
  - [12,7,2,9,11,13] => [9,11,13]
- k=5
  - [3,12,11,3,11] => []
  - [8,0,3,5,3,14,1,12,5] => [14,1,12,5]
  - [16,7,6,10,7,12] => [12]




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
  - [4,7,4,11] => false
  - [] => false
  - [9,12,2,2,9] => true
- k=3
  - [5,1,16,1] => false
  - [3] => true
  - [14,5,4,2,2] => false
- k=10
  - [10,10,10] => true
  - [9,4,9,12,0,16] => false
  - [14,10,2,6,13,5,8] => true




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
  - [6,10,7,8,4] => 10
  - [12,16,11,8,6,14,16,15] => 16
  - [12,10,6,5,8,1,11] => 10
- k=3
  - [11,10,9,2,10,2] => 9
  - [16,3,2] => 2
  - [8,13,1] => 1


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [12,14,8,4] => [12,1,14,1,8,1,4]
  - [12,16,16,11,14] => [12,1,16,1,16,1,11,1,14]
  - [9,12,2,3] => [9,1,12,1,2,1,3]
- k=10
  - [15,0,12,12,5,15,8] => [15,10,0,10,12,10,12,10,5,10,15,10,8]
  - [12,7,5] => [12,10,7,10,5]
  - [8,12,4] => [8,10,12,10,4]
- k=-2
  - [4,11] => [4,-2,11]
  - [0] => [0]
  - [12,8,7,10,11,16] => [12,-2,8,-2,7,-2,10,-2,11,-2,16]
- k=0
  - [0,1,12] => [0,0,1,0,12]
  - [] => []
  - [14,0,1] => [14,0,0,0,1]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [22,8] => true
  - [] => true
  - [16,30,16,30] => true
- k=3
  - [6] => true
  - [1,14,5] => false
  - [7,4] => false
- k=5
  - [2,3,9,4,0,16] => false
  - [16] => false
  - [14,10,5,3,1,16] => false


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
  - [0,18,12,10,4,12] => [0,18,12,10,4,12]
  - [8,3,5] => [8]
  - [16,18] => [16,18]
- k=3
  - [12,2,3] => [12,3]
  - [2,8,9,0,5,1] => [9,0]
  - [1,15] => [15]
- k=5
  - [4,12,10] => [10]
  - [1,10,15,0,14,4,6] => [10,15,0]
  - [14,25] => [25]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [2,12,6,9,6,3,5,4] => 9
  - [14,16] => 14
  - [5,9,12,4,4,9] => 9
- k=3
  - [15,15,11,7,15,8] => 15
  - [7,13,12,7] => 7
  - [2,4,0,14,7,1] => 4


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [11,7,11,3,15,11,3,13] => 3
  - [3,14] => 14
  - [9,1,16,3,9,2] => 2
- k=3
  - [3,16,12,1,14,14,3,15] => 3
  - [9,4,4,4,11,14,15,16,3,14] => 4
  - [5,16,15,6,14,11,4,1,7,13] => 5


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
  - [] => []
  - [9,7] => [1,1]
  - [2,12] => [0,0]
- k=3
  - [4,14,4] => [1,2,1]
  - [3] => [0]
  - [] => []
- k=10
  - [2,4] => [2,4]
  - [] => []
  - [16] => [6]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [9,1,1,3,10,4,13] => [18,2,2,6,20,8,26]
  - [0,5,0,1,7,10] => [0,10,0,2,14,20]
  - [12] => [24]
- k=3
  - [4,16,1,7,5,12] => [12,48,3,21,15,36]
  - [11,8,9,3,5,9] => [33,24,27,9,15,27]
  - [8,11,11,14,10] => [24,33,33,42,30]
- k=-2
  - [13,7,2,5] => [-26,-14,-4,-10]
  - [3,8,1] => [-6,-16,-2]
  - [10,0,7,13,10,8] => [-20,0,-14,-26,-20,-16]
- k=10
  - [] => []
  - [12,5,12,7,16,14,12] => [120,50,120,70,160,140,120]
  - [6,5,5,5,16,2] => [60,50,50,50,160,20]




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
  - [10,4,3,0,11,15,14] => [1024,16,8,1,2048,32768,16384]
  - [16,11,14] => [65536,2048,16384]
  - [11] => [2048]
- k=3
  - [14,0,3,3] => [4782969,1,27,27]
  - [12,14,12,8,0,5,10] => [531441,4782969,531441,6561,1,243,59049]
  - [13] => [1594323]
- k=4
  - [1,0] => [4,1]
  - [] => []
  - [] => []


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [0,8,9] => [0,64,81]
  - [] => []
  - [13,3,14,0] => [169,9,196,0]
- k=3
  - [3] => [27]
  - [15,7,1,11,7] => [3375,343,1,1331,343]
  - [12] => [1728]
- k=4
  - [2,15] => [16,50625]
  - [6,3,1,9,15] => [1296,81,1,6561,50625]
  - [11,9,11,5] => [14641,6561,14641,625]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [6,0,6,2,8] => [2,6,0,6,2,8]
  - [3,12,7,13,11,5,7] => [2,3,12,7,13,11,5,7]
  - [5,4] => [2,5,4]
- k=3
  - [15,12,13,15,15,4,8] => [3,15,12,13,15,15,4,8]
  - [6,0] => [3,6,0]
  - [14,5,16] => [3,14,5,16]
- k=-2
  - [14,3,2,11,6,10] => [-2,14,3,2,11,6,10]
  - [14,15,14,16,16] => [-2,14,15,14,16,16]
  - [0,12,12] => [-2,0,12,12]
- k=10
  - [3,3,7,1] => [10,3,3,7,1]
  - [3] => [10,3]
  - [5,15,15,0,15,0,6] => [10,5,15,15,0,15,0,6]




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
  - [2,15,3,15,7,1,6,7] => [2,3,15,7,1,6,7]
  - [6,0,2,3,9,6,10] => [6,2,3,9,6,10]
  - [16,8,8,2,11,5,10,15] => [16,8,2,11,5,10,15]
- k=3
  - [10,6,5,11,9,0,16,9,1] => [10,6,11,9,0,16,9,1]
  - [12,7,14,11,2,7,0,8,7,1] => [12,7,11,2,7,0,8,7,1]
  - [13,13,2,2,15,1,11,16,4] => [13,13,2,15,1,11,16,4]


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
  - [14,0,8,11,4] => [11]
  - [5,9,7,12] => [5,9,7]
- k=3
  - [12,6,9,12,18,21] => []
  - [15,13,9,1,13,2,12] => [13,1,13,2]
  - [9,24,3,13,3,12,2] => [13,2]
- k=5
  - [35,16,25,45] => [16]
  - [11,12,13,7,12,2,7] => [11,12,13,7,12,2,7]
  - [13,11,10] => [13,11]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [5,11] => [5,11]
  - [4,0,1,1,10,3,0] => [4,0,2,2,10,3,0]
  - [16] => [16]
- k=2, n=10
  - [7,9,2,13,9,1] => [7,9,10,13,9,1]
  - [15,4,6,8,5,2,0] => [15,4,6,8,5,10,0]
  - [2,2,10,14,3] => [10,10,10,14,3]
- k=3, n=-2
  - [3] => [-2]
  - [2,4] => [2,4]
  - [12,14,16,13,13,6] => [12,14,16,13,13,6]
- k=5, n=0
  - [4] => [4]
  - [5,5,5,5,5,5,5] => [0,0,0,0,0,0,0]
  - [15,3,5] => [15,3,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [15,2,12,5,2,11,9] => [15,15,15,15,15,15,15]
  - [6,16,11,8,15] => [6,6,6,6,6]
  - [9,14,13,6,0] => [9,9,9,9,9]
- k=2
  - [13,6,10,13,16] => [6,6,6,6,6]
  - [4,4,5,3,1,7,11,11] => [4,4,4,4,4,4,4,4]
  - [13,14] => [14,14]
- k=3
  - [4,9,8] => [8,8,8]
  - [5,3,3,3,9,11,14,11,15] => [3,3,3,3,3,3,3,3,3]
  - [2,3,10,3] => [10,10,10,10]
- k=5
  - [9,14,5,5,12] => [12,12,12,12,12]
  - [8,2,11,8,2,3,3,4,2,11,10] => [2,2,2,2,2,2,2,2,2,2,2]
  - [4,10,4,5,8,8,2,5,16] => [8,8,8,8,8,8,8,8,8]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [4,6,12,16,2,1,6] => [2,6,12,16,2,1,6]
  - [6,16,0,2,3] => [2,16,0,2,3]
  - [1,12,1,2] => [2,12,1,2]
- k=2, n=10
  - [12,3,13,3,8] => [12,10,13,3,8]
  - [5,15,12,9] => [5,10,12,9]
  - [15,12,13,6,7,8,10,11,4] => [15,10,13,6,7,8,10,11,4]
- k=3, n=-2
  - [5,5,12,7,15,9,9,7,11,5] => [5,5,-2,7,15,9,9,7,11,5]
  - [2,1,2,12,0,14] => [2,1,-2,12,0,14]
  - [13,13,2,12,16,0,6,9] => [13,13,-2,12,16,0,6,9]
- k=5, n=0
  - [12,7,10,0,13] => [12,7,10,0,0]
  - [12,3,3,6,11,3,14,1,8] => [12,3,3,6,0,3,14,1,8]
  - [7,14,12,7,14,7,9,5,6,6] => [7,14,12,7,0,7,9,5,6,6]


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
  - [12,13] => [13,12]
  - [14,15] => [15,14]
  - [] => []
- k=3
  - [5,9,5] => [5,9,5]
  - [16] => [16]
  - [9,15,10,12,13] => [10,12,13,9,15]
- k=-2
  - [12] => [12]
  - [6,8,7,14,6,10,5] => [7,14,6,10,5,6,8]
  - [16,9,3,9,1,9] => [3,9,1,9,16,9]
- k=10
  - [7,5,3] => [3,7,5]
  - [] => []
  - [4,11,1,16,12,11] => [1,16,12,11,4,11]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [14,10,2,8,12,13,10,9] => [10,2]
  - [6,12,6,8,16,4,11,2,7] => [12,6]
  - [8,0,0,12,16] => [0,0]
- k=2, n=3
  - [15,5,5,10,10,9,12,11,6,5,15] => [5,5,10]
  - [10,3,11,2,16,3,2,5,8,15,16] => [3,11,2]
  - [3,13,14,0,10,11,1,3,1,7,13,11,8] => [13,14,0]
- k=3, n=3
  - [13,12,9,0,13,13,8,10,1] => [9,0,13]
  - [1,11,1,6,5,15,10,4,16] => [1,6,5]
  - [5,9,7,8,9,8,12,0,14,13,0,6,6,5] => [7,8,9]
- k=3, n=4
  - [5,11,1,11,6,14,10,1,3,11] => [1,11,6,14]
  - [12,8,16,6,3,6,2,8,8,6,11,2,16,11] => [16,6,3,6]
  - [14,13,4,7,11,10,5,5,11,13,0] => [4,7,11,10]


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
  - [2,3,0,6,16,1,12,1,3] => [2,3]
  - [3,1,12,11,10,3,9,6,8] => [3,1]
  - [13,6,9] => [13,6]
- k=3
  - [14,14,4,1,10] => [14,14,4]
  - [12,1,14,15,12] => [12,1,14]
  - [6,14,13,9,2,5,1,0,11,11] => [6,14,13]
- k=5
  - [3,15,7,16,16,1,7,4,16] => [3,15,7,16,16]
  - [0,9,2,0,3,15,10,7,15,10,10] => [0,9,2,0,3]
  - [7,6,11,10,8,2] => [7,6,11,10,8]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




