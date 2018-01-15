# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [3,7,7] => [5,9,9]
  - [15,11,5,8,6,14] => [17,13,7,10,8,16]
  - [4,2,8,0,3] => [6,4,10,2,5]
- k=3
  - [] => []
  - [0] => [3]
  - [9,8,9] => [12,11,12]
- k=-2
  - [0,15,13,12] => [-2,13,11,10]
  - [14,13] => [12,11]
  - [13,10,10] => [11,8,8]
- k=10
  - [15,6,8,11,5,15] => [25,16,18,21,15,25]
  - [7,8,2,10,3] => [17,18,12,20,13]
  - [5] => [15]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [6,2,1,6] => [6,2,1,6,2]
  - [15,13,0] => [15,13,0,2]
  - [16,10,1,1,5] => [16,10,1,1,5,2]
- k=3
  - [2] => [2,3]
  - [1,3,9,4,12,6,12] => [1,3,9,4,12,6,12,3]
  - [1,15,8,3,2] => [1,15,8,3,2,3]
- k=-2
  - [4,7,5] => [4,7,5,-2]
  - [] => [-2]
  - [11,9,6,10] => [11,9,6,10,-2]
- k=10
  - [3,6,14,0,2,9,15] => [3,6,14,0,2,9,15,10]
  - [] => [10]
  - [11,3] => [11,3,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [13,2,9,4] => [1,4,4,6]
  - [1,0,7] => [3,2,2]
  - [] => []
- k=1, n=10
  - [] => []
  - [0] => [1]
  - [15,3,1,9,4,15,10] => [6,4,2,0,5,6,1]
- k=10, n=26
  - [] => []
  - [4,12] => [14,22]
  - [] => []
- k=13, n=26
  - [4,5,15,11,12,8] => [17,18,2,24,25,21]
  - [16,7,11,11] => [3,20,24,24]
  - [9,13,8,4] => [22,0,21,17]


Conceptual dependencies:
- [modulo-k](#modulo-k)
- [add-k](#add-k)

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
- [count-k](#count-k)

### count-k (parametric)

`count-k` counts occurrences of the number `k`.

Examples:
- k=2
  - [11,2,8,16] => 1
  - [3,6,8] => 0
  - [14,2,5,11] => 1
- k=3
  - [0,6,8,7,7,2] => 0
  - [1,8,6,10] => 0
  - [8,14,14] => 0
- k=10
  - [12,14] => 0
  - [16,14,12] => 0
  - [10,16,1,1,16,7] => 1




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [16,14,6,8,12] => [6,8,12]
  - [4,14,11,8,6,12] => [11,8,6,12]
  - [13,12,10,11,16] => [10,11,16]
- k=3
  - [2,10,14,1,14,1,5] => [1,14,1,5]
  - [14,2,11,7,7,6,13] => [7,7,6,13]
  - [8,1,13,0,1,7,0,1] => [0,1,7,0,1]
- k=5
  - [1,8,15,6,1,9,1,3,2,15,12] => [9,1,3,2,15,12]
  - [7,12,5,16,8,0,11,16,5] => [0,11,16,5]
  - [0,0,1,1,5,4,15,15,16,7,15] => [4,15,15,16,7,15]




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
- [head](#head)
- [tail](#tail)
- [has-k](#has-k)

### has-k (parametric)

`has-k` checks if the number `k` occurs in the list.

Examples:
- k=2
  - [15,14] => false
  - [14,3,1,16,9] => false
  - [0,12,9,10] => false
- k=3
  - [] => false
  - [] => false
  - [6,7,16,16,9,15,4] => false
- k=10
  - [11,0,1] => false
  - [8,12,15,15,3,3,16] => false
  - [7,6] => false




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
- [index-k](#index-k)

### index-k (parametric)

`index-k` get the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [10,8] => 8
  - [15,14,8,2,3,14,5] => 14
  - [1,11,16] => 11
- k=3
  - [3,9,16,16,5,1] => 16
  - [0,1,2,5,2,7] => 2
  - [13,7,16] => 16


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [14,0,16,4,16,13,7] => [14,1,0,1,16,1,4,1,16,1,13,1,7]
  - [7,7,1,9,9,16] => [7,1,7,1,1,1,9,1,9,1,16]
- k=10
  - [16,14,11] => [16,10,14,10,11]
  - [4,0,9,13] => [4,10,0,10,9,10,13]
  - [11,13,15] => [11,10,13,10,15]
- k=-2
  - [8,6,10] => [8,-2,6,-2,10]
  - [3,6,2,14,2] => [3,-2,6,-2,2,-2,14,-2,2]
  - [13,16,2,12,9] => [13,-2,16,-2,2,-2,12,-2,9]
- k=0
  - [3] => [3]
  - [6,13] => [6,0,13]
  - [14,4] => [14,0,4]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [16,6,1,10] => false
  - [] => true
  - [] => true
- k=3
  - [9,6] => true
  - [13,12,15,0] => false
  - [0,5,11] => false
- k=5
  - [12] => false
  - [14,12,0,1,7,3] => false
  - [12,9] => false


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
- [keep-mod-k](#keep-mod-k)

### keep-mod-k (parametric)

`keep-mod-k` gets elements which are divisible by `k`.

Examples:
- k=2
  - [4,11,9] => [4]
  - [5,12,15] => [12]
  - [12,11,14] => [12,14]
- k=3
  - [10] => []
  - [10,12,8,13,16,4,16] => [12]
  - [0,7,16,5,14,2] => [0]
- k=5
  - [] => []
  - [3,1,6] => []
  - [3,16,1,16] => []


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [11,9,10] => 10
  - [13,0,4,5,10,4,5,7,3] => 10
  - [12,9,9,10,6,14,9,2,10] => 12
- k=3
  - [14,14,15,11,2,12,4,4] => 14
  - [16,8,1,1,4,13,7,4] => 8
  - [6,2,10] => 2


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [8,8,10,13,5,12,7,4,14] => 5
  - [1,3] => 3
  - [3,12] => 12
- k=3
  - [16,12,5,2] => 12
  - [16,13,8,16,8,11,13] => 11
  - [12,15,1] => 15


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
  - [5,5,14,11,16,14] => [1,1,0,1,0,0]
  - [10,14,16,13,15,16] => [0,0,0,1,1,0]
  - [0,9,11,3] => [0,1,1,1]
- k=3
  - [11,10,14,2,11] => [2,1,2,2,2]
  - [7,2,15,4,12,8,15] => [1,2,0,1,0,2,0]
  - [8,5,6,8,3,2,9] => [2,2,0,2,0,2,0]
- k=10
  - [6,5] => [6,5]
  - [] => []
  - [6,8,3,14,14,3] => [6,8,3,4,4,3]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [7,16,13,5,4,3,13] => [14,32,26,10,8,6,26]
  - [12,12,0,10,10] => [24,24,0,20,20]
  - [8] => [16]
- k=3
  - [9,3,16,12,13,14,9] => [27,9,48,36,39,42,27]
  - [3,10,4,8] => [9,30,12,24]
  - [] => []
- k=-2
  - [5,12,0,14,14,10] => [-10,-24,0,-28,-28,-20]
  - [12,9,3,5,10,3,10] => [-24,-18,-6,-10,-20,-6,-20]
  - [3,11,13,11,3] => [-6,-22,-26,-22,-6]
- k=10
  - [15] => [150]
  - [6,6,11,16,14,8,9] => [60,60,110,160,140,80,90]
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
  - [] => [2]
  - [9,3,5] => [2,9,3,5]
  - [15,5,15] => [2,15,5,15]
- k=3
  - [] => [3]
  - [11] => [3,11]
  - [12] => [3,12]
- k=-2
  - [0,3,13,4] => [-2,0,3,13,4]
  - [8,16,8,11,10] => [-2,8,16,8,11,10]
  - [1] => [-2,1]
- k=10
  - [] => [10]
  - [5,1,13,14,11,14] => [10,5,1,13,14,11,14]
  - [3,4,15] => [10,3,4,15]




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
  - [12,13,12,0,11,4,1,9] => [12,12,0,11,4,1,9]
  - [4,9,9] => [4,9]
  - [11,5,9,15] => [11,9,15]
- k=3
  - [10,9,1,3,1,5,2,16] => [10,9,3,1,5,2,16]
  - [9,8,5,15] => [9,8,15]
  - [12,4,12,14,12] => [12,4,14,12]


Conceptual dependencies:
- [index-k](#index-k)

### remove-mod-head

`remove-mod-head` gets elements after the first number which are not divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [1,4,7,2]
- [4,2,6,10,8,12] => [2,6,10]
- [1,2,3] => []


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [remove-mod-k](#remove-mod-k)

### remove-mod-k (parametric)

`remove-mod-k` gets elements which are not divisible by `k`.

Examples:
- k=2
  - [2,8,9,16,3] => [9,3]
  - [5,14,8,4,13,8] => [5,13]
  - [1,7,11] => [1,7,11]
- k=3
  - [5,3] => [5]
  - [3,13,14] => [13,14]
  - [5,14,8,0] => [5,14,8]
- k=5
  - [3,10,7,9,9,1] => [3,7,9,9,1]
  - [5,4,0] => [4]
  - [3,4,0,14,2,4] => [3,4,14,2,4]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [2,14,0,1] => [2,14,0,2]
  - [3,13,14,4,13,0,8] => [3,13,14,4,13,0,8]
  - [16,13] => [16,13]
- k=2, n=10
  - [] => []
  - [0,8,14,13,2,10,8] => [0,8,14,13,10,10,8]
  - [8,15,12,3,5,1] => [8,15,12,3,5,1]
- k=3, n=-2
  - [4,1] => [4,1]
  - [5,0,3] => [5,0,-2]
  - [4,11,6,9] => [4,11,6,9]
- k=5, n=0
  - [13,14,4,7] => [13,14,4,7]
  - [16] => [16]
  - [] => []




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [0] => [0]
  - [7,16,12,0,6] => [7,7,7,7,7]
  - [13,13,8,9,2,9,10,5] => [13,13,13,13,13,13,13,13]
- k=2
  - [4,3,5,7,5,0,16,12] => [3,3,3,3,3,3,3,3]
  - [0,7] => [7,7]
  - [12,2] => [2,2]
- k=3
  - [2,6,8,13,12,12] => [8,8,8,8,8,8]
  - [16,14,9,0] => [9,9,9,9]
  - [12,11,2] => [2,2,2]
- k=5
  - [7,10,12,15,16,10,8,11,5,14] => [16,16,16,16,16,16,16,16,16,16]
  - [13,9,6,3,10,4] => [10,10,10,10,10,10]
  - [3,2,8,4,15] => [15,15,15,15,15]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [5,5,14,4,0,8,4] => [2,5,14,4,0,8,4]
  - [6,16,14,14,11,1,5,7] => [2,16,14,14,11,1,5,7]
  - [11,6,9,16,3,3,2] => [2,6,9,16,3,3,2]
- k=2, n=10
  - [8,13,11,10,6,15,4,8,7] => [8,10,11,10,6,15,4,8,7]
  - [4,3,10,8,13,15,4] => [4,10,10,8,13,15,4]
  - [4,8,10,3] => [4,10,10,3]
- k=3, n=-2
  - [13,12,9,1,4,5] => [13,12,-2,1,4,5]
  - [2,4,11,10,13,4,11,13,15,0] => [2,4,-2,10,13,4,11,13,15,0]
  - [11,4,9,4] => [11,4,-2,4]
- k=5, n=0
  - [16,6,11,13,4,14] => [16,6,11,13,0,14]
  - [4,11,7,5,16,10,11,4,7,16] => [4,11,7,5,0,10,11,4,7,16]
  - [13,7,2,0,3] => [13,7,2,0,0]


Conceptual dependencies:
- [index-k](#index-k)

### reverse

`reverse` reverses the list.

Examples:
- [2,0,4] => [4,0,2]
- [2,5,4,2,0,5,1,1] => [1,1,5,0,2,4,5,2]




### rotate-k (parametric)

`rotate-k` shifts number placements forward by `k` (shifts backward if `k` is negative).

Examples:
- k=1
  - [3,5,1,4,12,3] => [5,1,4,12,3,3]
  - [0,16] => [16,0]
  - [16,7,4,1,1] => [7,4,1,1,16]
- k=3
  - [16,9,14,13,14,13] => [13,14,13,16,9,14]
  - [9,15,0] => [9,15,0]
  - [0,11] => [11,0]
- k=-2
  - [] => []
  - [3,2,16,9,1,4,1] => [4,1,3,2,16,9,1]
  - [11] => [11]
- k=10
  - [7,1,0,13,6,5] => [6,5,7,1,0,13]
  - [2,6] => [2,6]
  - [9,5,9,10,10,8,0] => [10,10,8,0,9,5,9]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [13,2,16,13,7,3,1,13] => [2,16]
  - [5,7,8,14,8,3,9,10,5] => [7,8]
  - [12,1,11,11,5,0,0,2] => [1,11]
- k=2, n=3
  - [2,5,4,13,6,14,16] => [5,4,13]
  - [5,8,9,6,3,5,16,5,14,15,10,13] => [8,9,6]
  - [4,5,1,2,1,3,9,15] => [5,1,2]
- k=3, n=3
  - [2,15,4,7,4,5,0,15,8,11,11,16,1] => [4,7,4]
  - [15,5,2,2,8,16,12,16] => [2,2,8]
  - [11,13,15,11,6,2,12,14] => [15,11,6]
- k=3, n=4
  - [16,2,6,9,3,5,2,2,0] => [6,9,3,5]
  - [11,12,1,0,10,3,2,11,12,6,0,2,10,12] => [1,0,10,3]
  - [15,3,16,15,10,6,10,9,4,8,12,16,5] => [16,15,10,6]


Conceptual dependencies:
- [index-k](#index-k)
- [take-k](#take-k)

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
  - [16,7,14,12,12,14] => [16,7]
  - [16,16,4,15,16,8,15,7] => [16,16]
  - [5,1,11,4,9,4,10] => [5,1]
- k=3
  - [3,14,5,3,4,5,4,9,7] => [3,14,5]
  - [1,16,8,11,9,6] => [1,16,8]
  - [4,0,1,4,5,16,7,1] => [4,0,1]
- k=5
  - [6,2,7,13,11,9] => [6,2,7,13,11]
  - [13,14,11,1,5,6] => [13,14,11,1,5]
  - [16,6,12,4,15,3,2,4] => [16,6,12,4,15]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




