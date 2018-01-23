# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [1,16,13] => [3,18,15]
  - [13,15,3,8,11] => [15,17,5,10,13]
  - [13] => [15]
- k=3
  - [2,13,11,13] => [5,16,14,16]
  - [13,4,4,3,8] => [16,7,7,6,11]
  - [] => []
- k=-2
  - [] => []
  - [5,10,6] => [3,8,4]
  - [] => []
- k=10
  - [0,12] => [10,22]
  - [15,11,11,11,1] => [25,21,21,21,11]
  - [] => []




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [4,6,9,5] => [4,6,9,5,2]
  - [] => [2]
  - [15,15,11,8,16,0] => [15,15,11,8,16,0,2]
- k=3
  - [8,5,4] => [8,5,4,3]
  - [5,6,12,10,11,0] => [5,6,12,10,11,0,3]
  - [7,13,15] => [7,13,15,3]
- k=-2
  - [13] => [13,-2]
  - [4,1,10,2,5,2,7] => [4,1,10,2,5,2,7,-2]
  - [5,6] => [5,6,-2]
- k=10
  - [12,15,1,12,8,6] => [12,15,1,12,8,6,10]
  - [1,14,10,2,3,7,11] => [1,14,10,2,3,7,11,10]
  - [3,13,5,3,1,6,6] => [3,13,5,3,1,6,6,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [5,4] => [0,6]
  - [4,1,2] => [6,3,4]
  - [] => []
- k=1, n=10
  - [4,1,3,9] => [5,2,4,0]
  - [9,6,8,1] => [0,7,9,2]
  - [2,4,0,8,3,8] => [3,5,1,9,4,9]
- k=10, n=26
  - [22,4,20,16] => [6,14,4,0]
  - [1,15,1,20,25,8] => [11,25,11,4,9,18]
  - [3,1] => [13,11]
- k=13, n=26
  - [14,3,14] => [1,16,1]
  - [24] => [11]
  - [6,18] => [19,5]


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
  - [] => 0
  - [10,5,15,16,11] => 0
  - [7,5,13,8] => 0
- k=3
  - [8,14,10,13,16,13,1] => 0
  - [3] => 1
  - [11,16,1,14,6] => 0
- k=10
  - [8,12,4,3] => 0
  - [] => 0
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
  - [8,12,3,16,3,16] => [3,16,3,16]
  - [10,2,14] => [14]
  - [7,1,0,11] => [0,11]
- k=3
  - [16,7,0,4,6,12,3] => [4,6,12,3]
  - [6,4,16,4,2,7] => [4,2,7]
  - [13,7,15,5,6,13,3,10,6,5] => [5,6,13,3,10,6,5]
- k=5
  - [16,4,8,8,3,14,2,9,4,7,2,13] => [14,2,9,4,7,2,13]
  - [10,3,4,4,10,7,14,14,13,9,4,3] => [7,14,14,13,9,4,3]
  - [2,16,16,2,8,11,1,14,10,2,15,4] => [11,1,14,10,2,15,4]




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
  - [2,2,2,2,0] => true
  - [8,10,11] => false
  - [2,2,13,2,2,2,13] => true
- k=3
  - [9,11,1,0,9,7] => false
  - [3,3,3,3] => true
  - [3,16,3,16,3,3,3] => true
- k=10
  - [10] => true
  - [11,10,0,10] => true
  - [10] => true




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
  - [12,6,2,16,8,2,1,15] => 6
  - [9,12] => 12
  - [16,5,4,7,12] => 5
- k=3
  - [7,4,7,4,6] => 7
  - [12,16,0,15] => 0
  - [11,14,5,4,6,15,9,1,12] => 5


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [12,0,2,0,11] => [12,1,0,1,2,1,0,1,11]
  - [2,3,7,8,7] => [2,1,3,1,7,1,8,1,7]
  - [7,6,5,13,4,4] => [7,1,6,1,5,1,13,1,4,1,4]
- k=10
  - [0,15,9,9] => [0,10,15,10,9,10,9]
  - [13,14,10,15,12,15] => [13,10,14,10,10,10,15,10,12,10,15]
  - [0,11,0,16,9] => [0,10,11,10,0,10,16,10,9]
- k=-2
  - [7,9,8,7,9,13,10] => [7,-2,9,-2,8,-2,7,-2,9,-2,13,-2,10]
  - [11,11] => [11,-2,11]
  - [] => []
- k=0
  - [] => []
  - [8] => [8]
  - [16,14,8] => [16,0,14,0,8]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [24,26,4,10,24,28] => true
  - [2,14,13,15,4,3,13] => false
  - [2,1,11,9,0] => false
- k=3
  - [5,3,4,16,1] => false
  - [13,12,10,4] => false
  - [36,42,45,15,18] => true
- k=5
  - [16,4,1,12,0] => false
  - [6,7,10,13,9,12,16] => false
  - [] => true


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
  - [10,2,9] => [10,2]
  - [16,13,1,11,4] => [16,4]
  - [16,13,12,8,4,10] => [16,12,8,4,10]
- k=3
  - [3,9,9,10] => [3,9,9]
  - [5,0] => [0]
  - [] => []
- k=5
  - [4] => []
  - [7,15] => [15]
  - [13,15,3,9,8,1] => [15]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [3,5,10,8] => 8
  - [13,1,2] => 2
  - [11,8,14,5,13] => 13
- k=3
  - [11,5,13,1,1,10,4] => 10
  - [1,9,13,13,4,12,5,3,1] => 12
  - [15,5,15] => 5


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [4,1,13,10] => 4
  - [3,13,15,9,4,4,2] => 3
  - [7,4,4,1,16] => 4
- k=3
  - [0,15,3,10] => 10
  - [5,9,13,3,15,12,4] => 5
  - [0,8,1] => 8


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
  - [0,4,13,13,3,2,7] => [0,0,1,1,1,0,1]
  - [6,1,15,15,11] => [0,1,1,1,1]
  - [5] => [1]
- k=3
  - [4,15,15] => [1,0,0]
  - [3,12,15] => [0,0,0]
  - [1,7,7,5] => [1,1,1,2]
- k=10
  - [12,7,0,5,6,13,6] => [2,7,0,5,6,3,6]
  - [1,11,15,14] => [1,1,5,4]
  - [] => []




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [] => []
  - [] => []
  - [14] => [28]
- k=3
  - [15,5,10] => [45,15,30]
  - [4,13,6,1,6] => [12,39,18,3,18]
  - [8,15,6,13,13,10] => [24,45,18,39,39,30]
- k=-2
  - [8,11,4,4,10] => [-16,-22,-8,-8,-20]
  - [5,16,16,6,7] => [-10,-32,-32,-12,-14]
  - [7,9] => [-14,-18]
- k=10
  - [16,15,9] => [160,150,90]
  - [] => []
  - [7,8,7,3] => [70,80,70,30]




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
  - [5,3,0,4] => [2,5,3,0,4]
  - [] => [2]
- k=3
  - [13,9] => [3,13,9]
  - [4,13,15] => [3,4,13,15]
  - [10,8,2,9] => [3,10,8,2,9]
- k=-2
  - [9,10] => [-2,9,10]
  - [5,8,10,2] => [-2,5,8,10,2]
  - [10,4,9] => [-2,10,4,9]
- k=10
  - [9,5,10] => [10,9,5,10]
  - [5,14,8] => [10,5,14,8]
  - [0,2,12,8,0,8] => [10,0,2,12,8,0,8]




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
  - [5,7,4,3,4,2,14,7,4] => [5,4,3,4,2,14,7,4]
  - [0,9,15,13,10,3,5,6] => [0,15,13,10,3,5,6]
  - [15,1,0,4,5,14,10,11,8] => [15,0,4,5,14,10,11,8]
- k=3
  - [5,13,16] => [5,13]
  - [0,4,13] => [0,4]
  - [14,15,14] => [14,15]


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
  - [6,7,8,7,16,8] => [7,7]
  - [15,12,6,10,16] => [15]
  - [11,5,1,8,16] => [11,5,1]
- k=3
  - [0,5,6,7,4,7] => [5,7,4,7]
  - [16,12] => [16]
  - [15,7] => [7]
- k=5
  - [35,8,10,0,5,3,15] => [8,3]
  - [0,30] => []
  - [15,45,9,25,0] => [9]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [1,13,1] => [2,13,2]
  - [1,1,1] => [2,2,2]
  - [10,1,6,15,6,16] => [10,2,6,15,6,16]
- k=2, n=10
  - [7,11,11] => [7,11,11]
  - [2,2] => [10,10]
  - [7,1,6,6] => [7,1,6,6]
- k=3, n=-2
  - [] => []
  - [15,0,6,6,4,8,9] => [15,0,6,6,4,8,9]
  - [11,11] => [11,11]
- k=5, n=0
  - [5,14,5,11,5] => [0,14,0,11,0]
  - [] => []
  - [] => []




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [15,16,7,6,9,1] => [15,15,15,15,15,15]
  - [2,12,13,6] => [2,2,2,2]
  - [2,8,4,8,16] => [2,2,2,2,2]
- k=2
  - [1,16,14,11,6,3,8] => [16,16,16,16,16,16,16]
  - [1,7,3] => [7,7,7]
  - [13,11,10,7] => [11,11,11,11]
- k=3
  - [0,10,3,3,13,13,6,2,0,12] => [3,3,3,3,3,3,3,3,3,3]
  - [2,9,0,7] => [0,0,0,0]
  - [6,4,9,10,13,13,13,16,0,9] => [9,9,9,9,9,9,9,9,9,9]
- k=5
  - [0,16,14,3,4,1,12,4,10,6,9] => [4,4,4,4,4,4,4,4,4,4,4]
  - [1,11,2,1,15,9,6,16,14] => [15,15,15,15,15,15,15,15,15]
  - [11,8,10,10,13,14,13,1,3] => [13,13,13,13,13,13,13,13,13]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [7] => [2]
  - [9,13,9,9,1,9] => [2,13,9,9,1,9]
  - [0,7,2] => [2,7,2]
- k=2, n=10
  - [13,4,12,12,8,0] => [13,10,12,12,8,0]
  - [16,8,16,14,3,12,11] => [16,10,16,14,3,12,11]
  - [1,7] => [1,10]
- k=3, n=-2
  - [0,8,4,9,4,12,7,7] => [0,8,-2,9,4,12,7,7]
  - [8,15,8,14,2] => [8,15,-2,14,2]
  - [11,14,13] => [11,14,-2]
- k=5, n=0
  - [0,0,5,8,10,1,3,4,6,2] => [0,0,5,8,0,1,3,4,6,2]
  - [16,12,7,7,3,12,6] => [16,12,7,7,0,12,6]
  - [5,13,15,9,15,15,7,7,4,9,0] => [5,13,15,9,0,15,7,7,4,9,0]


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
  - [4,1,0,7,1,13,11] => [11,4,1,0,7,1,13]
  - [8] => [8]
- k=3
  - [12,16,0,12,8,15] => [12,8,15,12,16,0]
  - [] => []
  - [13] => [13]
- k=-2
  - [10,15,2,12,9,14,6] => [2,12,9,14,6,10,15]
  - [5,6,2,0] => [2,0,5,6]
  - [] => []
- k=10
  - [1,1,10,11,4] => [1,1,10,11,4]
  - [9,6,12,3,8] => [9,6,12,3,8]
  - [4] => [4]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [2,9,8,2,14,1,11,0,1,16,9,3] => [9,8]
  - [10,4,2,9,0] => [4,2]
  - [6,15,2,16,4,8,2,8,7,1] => [15,2]
- k=2, n=3
  - [7,8,0,11,12,16,9] => [8,0,11]
  - [7,1,14,9,12,16,10,3] => [1,14,9]
  - [13,0,8,11,12,8,16,14] => [0,8,11]
- k=3, n=3
  - [0,9,5,15,5,7,5,9,3,12,13,10,3,11] => [5,15,5]
  - [15,5,11,6,2,2,5,12,8] => [11,6,2]
  - [8,6,6,6,10,8,6] => [6,6,10]
- k=3, n=4
  - [2,7,1,10,10,3,5,4,10,6,4,6,8,8,12] => [1,10,10,3]
  - [3,7,13,4,1,1,8,12,2] => [13,4,1,1]
  - [14,9,8,6,11,13,5,7,9,0,9,15,5,0] => [8,6,11,13]


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
  - [0,5] => [0,5]
  - [16,1,15,2,12,4,5,14] => [16,1]
  - [14,3,15,7,6,15] => [14,3]
- k=3
  - [3,1,12] => [3,1,12]
  - [7,13,2,16,7,10,4,2] => [7,13,2]
  - [5,12,7,8,13,15] => [5,12,7]
- k=5
  - [11,15,11,1,3,6] => [11,15,11,1,3]
  - [16,8,11,10,11,0,10,0,7,14,1] => [16,8,11,10,11]
  - [1,6,11,2,1,1,6,9,3,6] => [1,6,11,2,1]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




