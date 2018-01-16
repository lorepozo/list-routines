# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [] => []
  - [2,9,15,11] => [4,11,17,13]
  - [16,5,6,5,15] => [18,7,8,7,17]
- k=3
  - [4,13,5,5] => [7,16,8,8]
  - [6,13,15] => [9,16,18]
  - [0,2,0,10] => [3,5,3,13]
- k=-2
  - [0,0,13,2,7,15] => [-2,-2,11,0,5,13]
  - [] => []
  - [10] => [8]
- k=10
  - [10,12,7,10] => [20,22,17,20]
  - [] => []
  - [2,8,3,15,11] => [12,18,13,25,21]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [7,3,9,1,12] => [7,3,9,1,12,2]
  - [1,14] => [1,14,2]
  - [14,8,6,10,6,15] => [14,8,6,10,6,15,2]
- k=3
  - [9,8,1,16,11] => [9,8,1,16,11,3]
  - [] => [3]
  - [8,4,13,5,11,5,10] => [8,4,13,5,11,5,10,3]
- k=-2
  - [1,15,14,1] => [1,15,14,1,-2]
  - [2,10] => [2,10,-2]
  - [0,12,1,6,9,9] => [0,12,1,6,9,9,-2]
- k=10
  - [9,3,1,12] => [9,3,1,12,10]
  - [13,3,7,13,10] => [13,3,7,13,10,10]
  - [6,0,10,4,11,9,2] => [6,0,10,4,11,9,2,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [] => []
  - [3] => [5]
  - [12] => [0]
- k=1, n=10
  - [5,15,10,13,6] => [6,6,1,4,7]
  - [13,13,0,12,2] => [4,4,1,3,3]
  - [16,16] => [7,7]
- k=10, n=26
  - [6,2,0] => [16,12,10]
  - [1,9,10] => [11,19,20]
  - [11,11,9] => [21,21,19]
- k=13, n=26
  - [2,0] => [15,13]
  - [5,3,7,1,13,4] => [18,16,20,14,0,17]
  - [0,9,0,16,6,12] => [13,22,13,3,19,25]


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
  - [9,16,14,8,16] => 0
  - [9,14] => 0
  - [14,12,14,13,9] => 0
- k=3
  - [] => 0
  - [12,9,8,9,9,14] => 0
  - [1,13,0,2,4] => 0
- k=10
  - [13,16,12] => 0
  - [] => 0
  - [3,0,11,13,6,8] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [13,14,16,3,10,10,15,12,2] => [16,3,10,10,15,12,2]
  - [13,6,2,2,6,14,3,9,6] => [2,2,6,14,3,9,6]
  - [2,11,6,15] => [6,15]
- k=3
  - [5,7,1] => []
  - [3,8,5,9,15,14,2,4,11] => [9,15,14,2,4,11]
  - [14,15,3,7,10,1,9,0] => [7,10,1,9,0]
- k=5
  - [16,8,14,0,14,2,16,14,10] => [2,16,14,10]
  - [6,9,8,10,6,13,9,9,6,10,5] => [13,9,9,6,10,5]
  - [6,11,12,10,1,12,14,8,9] => [12,14,8,9]




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
  - [4,2] => true
  - [] => false
  - [7,6,8,11,7,2,11] => true
- k=3
  - [3,4,9,4,9,13,0] => true
  - [] => false
  - [10,13,0,15,6,1] => false
- k=10
  - [4,5,1,2,8,3,4] => false
  - [1,1,12,3,16] => false
  - [10,3] => true




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
  - [9,13,4,4,8,12] => 13
  - [5,16,7,8,6,5] => 16
  - [3,7,5,13,10,3,16,4] => 7
- k=3
  - [16,14,11,8,2,12,12] => 11
  - [6,6,8,0,9] => 8
  - [7,4,7,6] => 7


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [6,0,5] => [6,1,0,1,5]
  - [14,11,16,0] => [14,1,11,1,16,1,0]
- k=10
  - [15,11,2,8] => [15,10,11,10,2,10,8]
  - [4] => [4]
  - [14,3,3,2] => [14,10,3,10,3,10,2]
- k=-2
  - [4,7,10,11] => [4,-2,7,-2,10,-2,11]
  - [5,15,6,7] => [5,-2,15,-2,6,-2,7]
  - [1,6,13,0,12] => [1,-2,6,-2,13,-2,0,-2,12]
- k=0
  - [] => []
  - [5] => [5]
  - [4] => [4]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [7,6,6] => false
  - [7,3,1,2,12] => false
  - [11] => false
- k=3
  - [9,0,4,15,5,14] => false
  - [11,15,9,5] => false
  - [15,7,14,7] => false
- k=5
  - [] => true
  - [12,4,7,14,9,11,8] => false
  - [3,11,9,6] => false


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
  - [14,2,7] => [14,2]
  - [10,5,15,6,6,5] => [10,6,6]
  - [13,12] => [12]
- k=3
  - [2,5] => []
  - [6,5,12,7,4,3,16] => [6,12,3]
  - [] => []
- k=5
  - [16,7] => []
  - [7,14] => []
  - [] => []


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [11,5,11,8,0] => 11
  - [0,12,8,2,1,8,5] => 8
  - [14,12,11,7] => 12
- k=3
  - [14,7,5,1,8] => 7
  - [1,5,14,8,12] => 8
  - [5,7,9,8,13,12] => 9


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [4,8,15,7,16] => 7
  - [7,0,13,2,14,0,7,14,13] => 0
  - [4,0,16] => 4
- k=3
  - [7,1,2,11,8] => 7
  - [12,16,4,11,3,5,4] => 4
  - [0,10,2,1] => 2


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
  - [9,1,3] => [1,1,1]
  - [] => []
  - [] => []
- k=3
  - [10,3,6,4,16] => [1,0,0,1,1]
  - [14,9] => [2,0]
  - [8,8,1] => [2,2,1]
- k=10
  - [13,8,1,7,3] => [3,8,1,7,3]
  - [16] => [6]
  - [9,13,6,8] => [9,3,6,8]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [7,0,1,4,10,10,13] => [14,0,2,8,20,20,26]
  - [15,0,3,0] => [30,0,6,0]
  - [12,4,9,4,0] => [24,8,18,8,0]
- k=3
  - [15,16,11,14,0,5] => [45,48,33,42,0,15]
  - [11,5,8,7,14,9] => [33,15,24,21,42,27]
  - [4,6,3,10,1,4,12] => [12,18,9,30,3,12,36]
- k=-2
  - [4,5,5,1,15,14] => [-8,-10,-10,-2,-30,-28]
  - [16,4] => [-32,-8]
  - [] => []
- k=10
  - [8] => [80]
  - [1,7,3,12,3,13,15] => [10,70,30,120,30,130,150]
  - [9,13,14,15,16] => [90,130,140,150,160]




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
  - [3,16,8,4,10] => [2,3,16,8,4,10]
  - [] => [2]
  - [6,6,9] => [2,6,6,9]
- k=3
  - [3,0] => [3,3,0]
  - [5] => [3,5]
  - [] => [3]
- k=-2
  - [14,2] => [-2,14,2]
  - [6,14,4,1,4,2,11] => [-2,6,14,4,1,4,2,11]
  - [] => [-2]
- k=10
  - [] => [10]
  - [10] => [10,10]
  - [6,9,12,2,0,12] => [10,6,9,12,2,0,12]




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
  - [0,4,5] => [0,5]
  - [16,6] => [16]
  - [12,14,13] => [12,13]
- k=3
  - [4,2,1,15,10,4,3,4,1] => [4,2,15,10,4,3,4,1]
  - [5,8,8,6,4,2,8,1] => [5,8,6,4,2,8,1]
  - [3,4,3,12,4,1,5,14] => [3,4,12,4,1,5,14]


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
  - [3,14,0,2] => [3]
  - [7,13] => [7,13]
  - [5,16,6,10,15,13,3] => [5,15,13,3]
- k=3
  - [1,13,2,5] => [1,13,2,5]
  - [5] => [5]
  - [2,2,7,14,12,3] => [2,2,7,14]
- k=5
  - [6,13,12] => [6,13,12]
  - [2,7,6,13,8] => [2,7,6,13,8]
  - [3,15,14,9,15,14,8] => [3,14,9,14,8]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [11,13,2] => [11,13,2]
  - [7,10,11,0] => [7,10,11,0]
  - [16,0,6,8,0] => [16,0,6,8,0]
- k=2, n=10
  - [10,13,1,6,3] => [10,13,1,6,3]
  - [6,10] => [6,10]
  - [3,4,6,16,7,0] => [3,4,6,16,7,0]
- k=3, n=-2
  - [0] => [0]
  - [2,1,13] => [2,1,13]
  - [4] => [4]
- k=5, n=0
  - [] => []
  - [5,3,6,6] => [0,3,6,6]
  - [6,8,13] => [6,8,13]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [13,12,14,4] => [13,13,13,13]
  - [8,3,2,15,8,12,9,7] => [8,8,8,8,8,8,8,8]
  - [7,2,8,4] => [7,7,7,7]
- k=2
  - [6,14] => [14,14]
  - [2,15,16] => [15,15,15]
  - [16,15,1,6,13,13] => [15,15,15,15,15,15]
- k=3
  - [13,6,16,8,4,9,1,8,8,12] => [16,16,16,16,16,16,16,16,16,16]
  - [6,0,2,15,3,14,9] => [2,2,2,2,2,2,2]
  - [6,12,9,16,5,13] => [9,9,9,9,9,9]
- k=5
  - [7,4,10,10,5,13,12,15,5] => [5,5,5,5,5,5,5,5,5]
  - [15,6,7,3,12,0,6,0] => [12,12,12,12,12,12,12,12]
  - [14,15,10,2,7,4,2,12] => [7,7,7,7,7,7,7,7]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [12] => [2]
  - [11,11,8,7,5,0] => [2,11,8,7,5,0]
  - [14,14,9,13,7,11,8,7] => [2,14,9,13,7,11,8,7]
- k=2, n=10
  - [0,8,10,1,4,6,12,9] => [0,10,10,1,4,6,12,9]
  - [14,11,4,4] => [14,10,4,4]
  - [11,16,6,15,15,4,7,11,2] => [11,10,6,15,15,4,7,11,2]
- k=3, n=-2
  - [11,10,8] => [11,10,-2]
  - [8,7,1,7,9,13,10,16,5] => [8,7,-2,7,9,13,10,16,5]
  - [11,15,4,13,9,3,16,16] => [11,15,-2,13,9,3,16,16]
- k=5, n=0
  - [6,0,15,0,16] => [6,0,15,0,0]
  - [16,3,16,7,11,11,3,11,14,7] => [16,3,16,7,0,11,3,11,14,7]
  - [13,5,10,16,13] => [13,5,10,16,0]


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
  - [] => []
  - [7,4] => [4,7]
  - [2,4,0] => [4,0,2]
- k=3
  - [9,12,3,10,3] => [10,3,9,12,3]
  - [7,8,6] => [7,8,6]
  - [3,1] => [1,3]
- k=-2
  - [12,3,9,2,7,6] => [7,6,12,3,9,2]
  - [14] => [14]
  - [1,1] => [1,1]
- k=10
  - [13,11,0] => [11,0,13]
  - [0,7,2,16] => [2,16,0,7]
  - [16] => [16]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [5,9,4,1,5,7,2,8,15,13] => [9,4]
  - [0,11,16,13,11,16,8,6,5,5] => [11,16]
  - [9,0,5,16,3,8,14,0,9,3,14] => [0,5]
- k=2, n=3
  - [9,8,11,8,2,10,5,2,9,4] => [8,11,8]
  - [10,6,13,9,10,14,14] => [6,13,9]
  - [15,11,8,2,6,2,3,8,1,10,0,5,6] => [11,8,2]
- k=3, n=3
  - [13,10,14,13,13,7,0,0,4,1,5,13] => [14,13,13]
  - [4,8,8,16,14,8,9,4,2,3,7,10,12,1] => [8,16,14]
  - [9,9,12,9,9,16,2,9,13] => [12,9,9]
- k=3, n=4
  - [6,10,9,15,9,8,5,16,13,13,12,6,16,10,9] => [9,15,9,8]
  - [2,7,11,16,15,15,0,1,14,8,7,0,0,4,10] => [11,16,15,15]
  - [8,1,11,8,5,8,5,13,15,15,1,6,12,3,12] => [11,8,5,8]


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
  - [9,3,1,7,15] => [9,3]
  - [1,15,7,14,6,11] => [1,15]
  - [8,2,5,0,14,10,13,5,0] => [8,2]
- k=3
  - [16,7,3,13,6] => [16,7,3]
  - [16,1,13,11,13,13] => [16,1,13]
  - [15,8,9,6,8,7,6] => [15,8,9]
- k=5
  - [0,6,15,7,1,15,8,6,0,5,12] => [0,6,15,7,1]
  - [2,1,8,14,3,14,14,5,3] => [2,1,8,14,3]
  - [8,12,15,1,16,2,8,1,4] => [8,12,15,1,16]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




