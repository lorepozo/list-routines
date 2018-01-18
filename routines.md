# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [2,2,2,11,10,16] => [4,4,4,13,12,18]
  - [] => []
  - [16,11,2,14] => [18,13,4,16]
- k=3
  - [13,9,9,16,15,9] => [16,12,12,19,18,12]
  - [4,8,15,5,11,12,11] => [7,11,18,8,14,15,14]
  - [14] => [17]
- k=-2
  - [2,8] => [0,6]
  - [6] => [4]
  - [16,8,5,15,15,8,16] => [14,6,3,13,13,6,14]
- k=10
  - [8,13,11,14,11] => [18,23,21,24,21]
  - [10,3,5,11,3] => [20,13,15,21,13]
  - [6,4] => [16,14]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [7,5] => [7,5,2]
  - [14,3,6,16,5,1,15] => [14,3,6,16,5,1,15,2]
  - [3] => [3,2]
- k=3
  - [1,7,10,3] => [1,7,10,3,3]
  - [13,2,12,7,11,4] => [13,2,12,7,11,4,3]
  - [1,16,2,0,3,6,1] => [1,16,2,0,3,6,1,3]
- k=-2
  - [16,13,1,3,4,2] => [16,13,1,3,4,2,-2]
  - [0] => [0,-2]
  - [] => [-2]
- k=10
  - [8,2] => [8,2,10]
  - [10,8,2,1,3,4,8] => [10,8,2,1,3,4,8,10]
  - [] => [10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [5] => [0]
  - [] => []
  - [0,5,2,6,4,5] => [2,0,4,1,6,0]
- k=1, n=10
  - [1,8,5,0] => [2,9,6,1]
  - [0,0,6,3,7,1] => [1,1,7,4,8,2]
  - [5,2,9,9,6] => [6,3,0,0,7]
- k=10, n=26
  - [15,3,19,8,3,18,7] => [25,13,3,18,13,2,17]
  - [22,25,2,11,0,7,9] => [6,9,12,21,10,17,19]
  - [24,0,1] => [8,10,11]
- k=13, n=26
  - [] => []
  - [12,16,20] => [25,3,7]
  - [1,19,1,11] => [14,6,14,24]


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
  - [1,1,2,1] => 1
  - [4] => 0
  - [7,11,5,5] => 0
- k=3
  - [3] => 1
  - [12,14,8,0,11,10] => 0
  - [12,7,13,10,8,13] => 0
- k=10
  - [9,14,13,4,8,4] => 0
  - [8,5,7] => 0
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
  - [15,13,6,6,15] => [6,6,15]
  - [8,1] => []
  - [5,8,5,16,1,14,6,12,8] => [5,16,1,14,6,12,8]
- k=3
  - [15,5,8] => []
  - [13,5,3,6,10,10,5,4,13] => [6,10,10,5,4,13]
  - [6,5,8,9,6,14] => [9,6,14]
- k=5
  - [12,8,3,8,12] => []
  - [16,10,3,0,11,7,6,2,13,16,5] => [7,6,2,13,16,5]
  - [2,15,16,15,4,8,9,12,5,10,10] => [8,9,12,5,10,10]




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
- [has-k](#has-k-parametric)

### has-k (parametric)

`has-k` checks if the number `k` occurs in the list.

Examples:
- k=2
  - [15,2,2,2,2,2,16] => true
  - [2] => true
  - [13,2,16] => true
- k=3
  - [12,13,14,10,13] => false
  - [15,3] => true
  - [8,4] => false
- k=10
  - [] => false
  - [14,10] => true
  - [10,10] => true




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
  - [2,6] => 6
  - [4,6,5,2,14,15] => 6
  - [6,5,5,4,3,15,14] => 5
- k=3
  - [10,2,0,7,16,5,12] => 0
  - [12,13,4,5,10,10,11,2,3,2] => 4
  - [14,1,5,8,3,15] => 5


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [] => []
  - [7,6,12,9] => [7,1,6,1,12,1,9]
  - [8,13,4] => [8,1,13,1,4]
- k=10
  - [14] => [14]
  - [] => []
  - [0,0,6] => [0,10,0,10,6]
- k=-2
  - [15,3,3] => [15,-2,3,-2,3]
  - [7,8,11,13] => [7,-2,8,-2,11,-2,13]
  - [13,4,10,8] => [13,-2,4,-2,10,-2,8]
- k=0
  - [9] => [9]
  - [3,5] => [3,0,5]
  - [13,15,12,4,8,5,11] => [13,0,15,0,12,0,4,0,8,0,5,0,11]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [14,26,10] => true
  - [] => true
  - [7,13,16,4,8,15,11] => false
- k=3
  - [7,3,12,15] => false
  - [] => true
  - [18,30,21,21] => true
- k=5
  - [75,80,15,50,25,0] => true
  - [7,7,8] => false
  - [75] => true


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
  - [] => []
  - [1,13,11,15,8] => [8]
  - [1,7,0,9,3,7] => [0]
- k=3
  - [9,10,6] => [9,6]
  - [3,1,10,16,14,4,15] => [3,15]
  - [6,1,9,27,3,21] => [6,9,27,3,21]
- k=5
  - [10,11,15,14] => [10,15]
  - [4] => []
  - [10] => [10]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [8,5] => 5
  - [15,8,8,3,9] => 9
  - [6,7,8,15,9,6,9,10,13] => 13
- k=3
  - [11,7,10,9,16,9,2,10,0,3] => 10
  - [11,16,9,5,6,1,8,15,10,11] => 11
  - [11,5,8,4,1] => 5


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [12,6,0,13,8,0,12,3] => 0
  - [14,13,14,6,6,1,13,13] => 6
  - [10,13,7,10,15,15,16] => 10
- k=3
  - [13,2,7,11,12,6] => 7
  - [7,11,3,11,10,5,7,1,8,1] => 3
  - [1,3,11] => 11


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
  - [1,2,16,14,15] => [1,0,0,0,1]
  - [11,5,4,1] => [1,1,0,1]
  - [10,2] => [0,0]
- k=3
  - [16,8,10] => [1,2,1]
  - [] => []
  - [14,14,2,11,5,12,2] => [2,2,2,2,2,0,2]
- k=10
  - [7,3,12] => [7,3,2]
  - [] => []
  - [1,12,12,16,7,7,7] => [1,2,2,6,7,7,7]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [11] => [22]
  - [] => []
  - [9,3,1,1] => [18,6,2,2]
- k=3
  - [] => []
  - [1,3,15,5] => [3,9,45,15]
  - [7,5] => [21,15]
- k=-2
  - [1,4,6,14,7] => [-2,-8,-12,-28,-14]
  - [15,13,4,14,10] => [-30,-26,-8,-28,-20]
  - [] => []
- k=10
  - [2,16,6,0,14,14,1] => [20,160,60,0,140,140,10]
  - [8,2] => [80,20]
  - [16,6,2,7,0,8] => [160,60,20,70,0,80]




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
  - [3,16,8,15,11,5,10] => [2,3,16,8,15,11,5,10]
  - [13,11,2,9] => [2,13,11,2,9]
  - [3,13,3,2,2,10,13] => [2,3,13,3,2,2,10,13]
- k=3
  - [] => [3]
  - [8,0,0,2,6] => [3,8,0,0,2,6]
  - [7,10,0] => [3,7,10,0]
- k=-2
  - [1,5,9] => [-2,1,5,9]
  - [6] => [-2,6]
  - [13,3,12,10] => [-2,13,3,12,10]
- k=10
  - [9] => [10,9]
  - [2,13,7,13,11,6] => [10,2,13,7,13,11,6]
  - [5] => [10,5]




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
  - [10,9,6,9,2,4,15,14] => [10,6,9,2,4,15,14]
  - [11,16,14,4,8] => [11,14,4,8]
  - [13,2,1,5,4] => [13,1,5,4]
- k=3
  - [2,16,5,13,6,16,7,15,12] => [2,16,13,6,16,7,15,12]
  - [2,9,9,10] => [2,9,10]
  - [6,1,1,0,5,13,5,12,11] => [6,1,0,5,13,5,12,11]


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
  - [9,2] => [9]
  - [3,6] => [3]
  - [] => []
- k=3
  - [0,18,5] => [5]
  - [3] => []
  - [12] => []
- k=5
  - [3,12,13,12] => [3,12,13,12]
  - [12,10,3] => [12,3]
  - [10,7,13,11,7,11] => [7,13,11,7,11]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Examples:
- k=1, n=2
  - [] => []
  - [] => []
  - [] => []
- k=2, n=10
  - [15,10,1,8,2,7,10] => [15,10,1,8,10,7,10]
  - [2,12] => [10,12]
  - [2] => [10]
- k=3, n=-2
  - [3,5,2,3,3] => [-2,5,2,-2,-2]
  - [3,3,3,3,3,3] => [-2,-2,-2,-2,-2,-2]
  - [3,6,3,3] => [-2,6,-2,-2]
- k=5, n=0
  - [5,5,5] => [0,0,0]
  - [5,5,5,5,5,5] => [0,0,0,0,0,0]
  - [5,5,5,9,5] => [0,0,0,9,0]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [3,14,12,15,4,16,13,14] => [3,3,3,3,3,3,3,3]
  - [12,4,15,11,4] => [12,12,12,12,12]
  - [8] => [8]
- k=2
  - [11,8] => [8,8]
  - [7,14,4,15] => [14,14,14,14]
  - [0,13,6,2,16] => [13,13,13,13,13]
- k=3
  - [2,3,9,7,13,3,10] => [9,9,9,9,9,9,9]
  - [7,14,1,15,2,15] => [1,1,1,1,1,1]
  - [6,15,6,5,4] => [6,6,6,6,6]
- k=5
  - [2,15,4,1,16,5,4] => [16,16,16,16,16,16,16]
  - [1,14,12,0,16,0] => [16,16,16,16,16,16]
  - [16,10,10,13,15,13,4,3,12] => [15,15,15,15,15,15,15,15,15]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [3] => [2]
  - [13,11,2] => [2,11,2]
  - [1,5] => [2,5]
- k=2, n=10
  - [10,16,2,14,5,2] => [10,10,2,14,5,2]
  - [9,10,13,4] => [9,10,13,4]
  - [13,6,16,2,10,15,8,12] => [13,10,16,2,10,15,8,12]
- k=3, n=-2
  - [6,3,9,9,4,12,14,3] => [6,3,-2,9,4,12,14,3]
  - [0,13,2,3] => [0,13,-2,3]
  - [0,10,15] => [0,10,-2]
- k=5, n=0
  - [14,7,7,2,13,3,7,3,2,16,10,5] => [14,7,7,2,0,3,7,3,2,16,10,5]
  - [11,1,0,0,5,8,1,9,13,3,12,1] => [11,1,0,0,0,8,1,9,13,3,12,1]
  - [14,6,6,16,9,2,11,15] => [14,6,6,16,0,2,11,15]


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
  - [0,12,15,6] => [12,15,6,0]
  - [15,12] => [12,15]
  - [2,10,0,2,6,12] => [10,0,2,6,12,2]
- k=3
  - [9,1,13,3,2] => [3,2,9,1,13]
  - [6,16,2,13,15,13] => [13,15,13,6,16,2]
  - [] => []
- k=-2
  - [1,6,8] => [6,8,1]
  - [8,16,0,14] => [0,14,8,16]
  - [] => []
- k=10
  - [2,1,9] => [1,9,2]
  - [5,9,3,10,5,11] => [5,11,5,9,3,10]
  - [16,12,0,9,9,7,14] => [9,9,7,14,16,12,0]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [6,7,15,3,16,2,9,1,2,11,13] => [7,15]
  - [3,11,10,1,2,2,16,5] => [11,10]
  - [7,2,8,3,13,0,16,16,1,15,11] => [2,8]
- k=2, n=3
  - [12,12,9,12,13,2,14] => [12,9,12]
  - [5,3,12,5,2,0,5] => [3,12,5]
  - [16,14,14,10,4,13,7,3,9,5,11,11,14] => [14,14,10]
- k=3, n=3
  - [6,13,7,8,13,14,6,7,7,13,2,15] => [7,8,13]
  - [4,12,3,11,11,14,15] => [3,11,11]
  - [5,7,16,13,9,6,10,4,8,1,14,10,7] => [16,13,9]
- k=3, n=4
  - [3,8,11,16,12,1,11,5,9] => [11,16,12,1]
  - [14,14,2,8,5,13,7,4,10,13,6,14,15,6,1] => [2,8,5,13]
  - [3,5,1,9,8,6,6,3,1,8] => [1,9,8,6]


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
  - [13,16,8,5,5,7] => [13,16]
  - [5,11,6] => [5,11]
  - [3,15] => [3,15]
- k=3
  - [5,15,2,9,8,11] => [5,15,2]
  - [14,7,1,11,16,13,13,4,5] => [14,7,1]
  - [13,8,12] => [13,8,12]
- k=5
  - [2,6,13,16,14,1,12,3,10,14,10] => [2,6,13,16,14]
  - [4,0,2,11,4,10] => [4,0,2,11,4]
  - [0,1,8,15,3,14,14,13,13,8] => [0,1,8,15,3]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




