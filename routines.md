# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=1
  - [] => []
  - [0,9,9] => [1,10,10]
  - [4,14,13] => [5,15,14]
- k=2
  - [8,1] => [10,3]
  - [12,11,0,1,4,14,16] => [14,13,2,3,6,16,18]
  - [] => []
- k=3
  - [7,0,11,2,6,14,2] => [10,3,14,5,9,17,5]
  - [1,16,14,10] => [4,19,17,13]
  - [15] => [18]
- k=-2
  - [14,15,11,12,12] => [12,13,9,10,10]
  - [11,13,8,6,10,5] => [9,11,6,4,8,3]
  - [4,13,7,4,6] => [2,11,5,2,4]
- k=10
  - [7,1] => [17,11]
  - [10,14,10,13,5] => [20,24,20,23,15]
  - [9,4,4] => [19,14,14]




### append-index-k (parametric)

`append-index-k` appends the `k`-th number of the list.

Examples:
- k=2
  - [6,10,9] => [6,10,9,10]
  - [5,10,10,8,15,2,8] => [5,10,10,8,15,2,8,10]
  - [11,11,16,14,12,11,8,11,2] => [11,11,16,14,12,11,8,11,2,11]
- k=3
  - [3,4,0,1,0,5,3,6,9] => [3,4,0,1,0,5,3,6,9,0]
  - [6,4,11,5,15] => [6,4,11,5,15,11]
  - [11,6,13,3,12,14,0,2,0] => [11,6,13,3,12,14,0,2,0,13]


Conceptual dependencies:
- [append-k](#append-k-parametric)
- [index-k](#index-k-parametric)

### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [12,8,7,11,4] => [12,8,7,11,4,2]
  - [9,15,9,16,8,1,4] => [9,15,9,16,8,1,4,2]
  - [14,12,12,13,7,15] => [14,12,12,13,7,15,2]
- k=3
  - [1,9,12] => [1,9,12,3]
  - [11,9,16,1,12,5] => [11,9,16,1,12,5,3]
  - [9,7,11,11,5,6,14] => [9,7,11,11,5,6,14,3]
- k=-2
  - [13,10,8,9,11,1,14] => [13,10,8,9,11,1,14,-2]
  - [4] => [4,-2]
  - [7,16,7,15] => [7,16,7,15,-2]
- k=10
  - [0,13,11,2] => [0,13,11,2,10]
  - [0,9,4,10] => [0,9,4,10,10]
  - [13,5,2,9] => [13,5,2,9,10]




### caesar-cipher-k-modulo-n (parametric)

`caesar-cipher-k-modulo-n` performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.

Examples:
- k=2, n=7
  - [0,3] => [2,5]
  - [4,3] => [6,5]
  - [] => []
- k=1, n=10
  - [0,2,2,5,3] => [1,3,3,6,4]
  - [5,4,2,9] => [6,5,3,0]
  - [4,0,4,2,0] => [5,1,5,3,1]
- k=10, n=26
  - [1,12,3,16,8,20] => [11,22,13,0,18,4]
  - [21,2] => [5,12]
  - [7,19,13,2,8,21] => [17,3,23,12,18,5]
- k=13, n=26
  - [0,2,4] => [13,15,17]
  - [24,1,7] => [11,14,20]
  - [1] => [14]


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
  - [2,8,2] => 2
  - [] => 0
  - [4,10,7,9,4,5] => 0
- k=3
  - [3] => 1
  - [7,5,12] => 0
  - [11,5,9] => 0
- k=10
  - [12,1,2,7,12,7,7] => 0
  - [14,10,9,6,16] => 1
  - [9] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Examples:
- k=2
  - [1,0,8,10,0,14,9,6,1] => [8,10,0,14,9,6,1]
  - [15,16,9,10,14] => [9,10,14]
  - [7,4,10,8,4,5,6,9,10] => [10,8,4,5,6,9,10]
- k=3
  - [12,9,10,5,4,11,16,0] => [5,4,11,16,0]
  - [16,11,15,1] => [1]
  - [15,9,4,6] => [6]
- k=5
  - [12,14,14,10,14,3,11,5] => [3,11,5]
  - [2,0,2,13,6,4,16,4,6] => [4,16,4,6]
  - [6,8,9,6,7,15,11,11,4,13] => [15,11,11,4,13]




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




### fibonacci

`fibonacci` returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.

Examples:
- 2 => 1
- 4 => 3
- 6 => 8
- 9 => 34




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
  - [5] => false
  - [15,5,3,4,0,13,11] => false
  - [2] => true
- k=3
  - [16,3,3] => true
  - [8,0,4] => false
  - [3] => true
- k=10
  - [3,13] => false
  - [10,10,10,8] => true
  - [13,11,10,10,0,0] => true




### head

`head` gets the first element of the list.

Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### identify-geq-k (parametric)

`identify-geq-k` replaces numbers greater than or equal to `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [0,8,2] => [0,1,1]
  - [7,6,12,1,15] => [1,1,1,0,1]
  - [6,2,3,16,9] => [1,1,1,1,1]
- k=3
  - [7,5,16,12,6,8,14] => [1,1,1,1,1,1,1]
  - [-1,-1,-1,-1,6] => [0,0,0,0,1]
  - [9,15,0,16,12,10] => [1,1,0,1,1,1]
- k=7
  - [5,9,13] => [0,1,1]
  - [10,10,9,14,6,4,7] => [1,1,1,1,0,0,1]
  - [10,11,4,2] => [1,1,0,0]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Examples:
- k=2
  - [14,2,13,4,1,16,7] => [1,1,0,1,0,1,0]
  - [2,7,11,15,1,9,14] => [1,0,0,0,0,0,1]
  - [14,2,2,16,2,2,10] => [1,1,1,1,1,1,1]
- k=3
  - [3,3,3,11,16] => [1,1,1,0,0]
  - [3,15,3,3] => [1,1,1,1]
  - [13,8,16,13,15] => [0,0,0,0,1]
- k=7
  - [0,10,14] => [1,0,1]
  - [7,5] => [1,0]
  - [14,7,7,7,7,7,7] => [1,1,1,1,1,1,1]




### identify-is-prime

`identify-is-prime` replaces prime numbers with 1, leaving all others to 0.

Examples:
- [2] => [1]
- [2,0] => [1,0]
- [5,11] => [1,1]
- [5,11,12] => [1,1,0]
- [2,3,4,5,7,9] => [1,1,0,1,1,0]




### identify-k (parametric)

`identify-k` replaces occurences of `k` with 1, leaving all others to 0.

Examples:
- k=1
  - [3,7,7,1,15,5] => [0,0,0,1,0,0]
  - [7,10] => [0,0]
  - [] => []
- k=2
  - [2,2,2,2] => [1,1,1,1]
  - [10,6,12] => [0,0,0]
  - [2] => [1]
- k=3
  - [0,8,0,3,12,0] => [0,0,0,1,0,0]
  - [15,16] => [0,0]
  - [3] => [1]
- k=-2
  - [7,5,4,13] => [0,0,0,0]
  - [7,1,0,11,6] => [0,0,0,0,0]
  - [] => []
- k=10
  - [9] => [0]
  - [9,0,16,2,4] => [0,0,0,0,0]
  - [2,8,9,2,9] => [0,0,0,0,0]




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
  - [11,13,7] => 13
  - [14,2,12,0,1,13,16] => 2
  - [14,11,1,6,11,10] => 11
- k=3
  - [2,10,3,15,15,3] => 3
  - [6,10,5] => 5
  - [9,7,16,5,3,4,2,16,5] => 16


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Examples:
- k=1
  - [9,1] => [9,1,1]
  - [13,8,6] => [13,1,8,1,6]
  - [13,4,5,1,8,14,1] => [13,1,4,1,5,1,1,1,8,1,14,1,1]
- k=10
  - [16,10,14,6,7,7] => [16,10,10,10,14,10,6,10,7,10,7]
  - [6,0,3] => [6,10,0,10,3]
  - [1,16,4,14,8,0] => [1,10,16,10,4,10,14,10,8,10,0]
- k=-2
  - [] => []
  - [10,11,1,16,12,16] => [10,-2,11,-2,1,-2,16,-2,12,-2,16]
  - [14,15,8,12,10,7,15] => [14,-2,15,-2,8,-2,12,-2,10,-2,7,-2,15]
- k=0
  - [3,2,15,6,4,6] => [3,0,2,0,15,0,6,0,4,0,6]
  - [9,12,4,12,7,0] => [9,0,12,0,4,0,12,0,7,0,0]
  - [9,2,9,15,14,12,9] => [9,0,2,0,9,0,15,0,14,0,12,0,9]




### is-evens

`is-evens` checks if all numbers of the list are even.

Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Examples:
- k=2
  - [8] => true
  - [16,20,6,12,14] => true
  - [] => true
- k=3
  - [14,11,7,9,6,15] => false
  - [0,39,45,27,12,42] => true
  - [30,36] => true
- k=5
  - [55,45,25,30] => true
  - [13] => false
  - [4] => false


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)
- [identify-is-mod-k](#identify-is-mod-k-parametric)

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


Conceptual dependencies:
- [identify-is-prime](#identify-is-prime)

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
  - [14,1,8,2] => [14,8,2]
  - [14,4,8,15,13] => [14,4,8]
  - [2,9,10,9] => [2,10]
- k=3
  - [15,4,5] => [15]
  - [11] => []
  - [12,3,24,21,0,9] => [12,3,24,21,0,9]
- k=5
  - [3,14,3] => []
  - [16,16,5,0,4] => [5,0]
  - [13,15,2] => [15]


Conceptual dependencies:
- [evens](#evens)
- [odds](#odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Examples:
- k=2
  - [6,13,3,5] => 6
  - [11,7,1,8,10] => 10
  - [16,7,14] => 14
- k=3
  - [9,1,14,11,7,4] => 9
  - [16,6,6,5,14] => 6
  - [9,0,1,4,5,13,15] => 9


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Examples:
- k=2
  - [5,6,16,10,11,2,10,6,7] => 5
  - [16,14,5] => 14
  - [11,5,4] => 5
- k=3
  - [9,9,1,10] => 9
  - [10,4,14,15,3,11,11] => 10
  - [8,2,9,15,10,5,11,4] => 5


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
  - [1,13,6,2] => [1,1,0,0]
  - [14] => [0]
  - [8,6,3,13] => [0,0,1,1]
- k=3
  - [9,3,6,5,13] => [0,0,0,2,1]
  - [] => []
  - [9,13] => [0,1]
- k=10
  - [16,5,7,0,0] => [6,5,7,0,0]
  - [16,9,1,2,12,6,8] => [6,9,1,2,2,6,8]
  - [9,14] => [9,4]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [1,3,7,12] => [2,6,14,24]
  - [5,8,2,16,3] => [10,16,4,32,6]
  - [8,3,5] => [16,6,10]
- k=3
  - [14] => [42]
  - [0] => [0]
  - [] => []
- k=-2
  - [15,11,4,3] => [-30,-22,-8,-6]
  - [9,7,16,7,8] => [-18,-14,-32,-14,-16]
  - [4,13] => [-8,-26]
- k=10
  - [6] => [60]
  - [1,4,16,6,9] => [10,40,160,60,90]
  - [8,15,6] => [80,150,60]




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
  - [0,8,6,6,7,3] => [1,256,64,64,128,8]
  - [9,1,7,4,0] => [512,2,128,16,1]
  - [] => []
- k=3
  - [0] => [1]
  - [] => []
  - [5] => [243]
- k=4
  - [6,0,5,11,3] => [4096,1,1024,4194304,64]
  - [0,9,6] => [1,262144,4096]
  - [] => []


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Examples:
- k=2
  - [12,6,1] => [144,36,1]
  - [10,2,2,5,16,4,6] => [100,4,4,25,256,16,36]
  - [13] => [169]
- k=3
  - [16,3,3,8,4] => [4096,27,27,512,64]
  - [7,14] => [343,2744]
  - [0] => [0]
- k=4
  - [0,2] => [0,16]
  - [0] => [0]
  - [3,7] => [81,2401]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-index-k (parametric)

`prepend-index-k` prepends the `k`-th number of the list.

Examples:
- k=2
  - [10,13] => [13,10,13]
  - [9,2,5,5,1] => [2,9,2,5,5,1]
  - [6,15] => [15,6,15]
- k=3
  - [2,8,0,15,11,13,10] => [0,2,8,0,15,11,13,10]
  - [2,5,16,4,16,13,8,12,5,13] => [16,2,5,16,4,16,13,8,12,5,13]
  - [0,5,7,2,16,12,14] => [7,0,5,7,2,16,12,14]


Conceptual dependencies:
- [prepend-k](#prepend-k-parametric)
- [index-k](#index-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [2,11,13] => [2,2,11,13]
  - [6,15,13,8,15,6,5] => [2,6,15,13,8,15,6,5]
  - [10,3,0] => [2,10,3,0]
- k=3
  - [0] => [3,0]
  - [15,4] => [3,15,4]
  - [7,5,4,9,16,12,4] => [3,7,5,4,9,16,12,4]
- k=-2
  - [13,2,4,10,4,4,16] => [-2,13,2,4,10,4,4,16]
  - [6,9,6,13,4] => [-2,6,9,6,13,4]
  - [10,5] => [-2,10,5]
- k=10
  - [16,6,11,8,9,6,8] => [10,16,6,11,8,9,6,8]
  - [1,14,2,0,5,14,3] => [10,1,14,2,0,5,14,3]
  - [12,4,4,8,12,2] => [10,12,4,4,8,12,2]




### prime

`prime` returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.

Examples:
- 1 => 2
- 2 => 3
- 3 => 5
- 7 => 17




### product

`product` multiplies all elements of the list.

Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 2




### range

`range` returns a list of numbers from 0 up to – exclusively – the given number.

Examples:
- 0 => []
- 1 => [0]
- 2 => [0,1]
- 3 => [0,1,2]
- 7 => [0,1,2,3,4,5,6]




### remove-index-k (parametric)

`remove-index-k` removes the `k`-th number in the list (starting at 1).

Examples:
- k=2
  - [5,14,13,9,3,6] => [5,13,9,3,6]
  - [16,9,13] => [16,13]
  - [13,16,0,3,8,8,0] => [13,0,3,8,8,0]
- k=3
  - [2,1,10,5,1,7,3,9] => [2,1,5,1,7,3,9]
  - [15,2,10,5,4] => [15,2,5,4]
  - [11,15,7,3,8,14,8] => [11,15,3,8,14,8]


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
  - [4,5,13] => [5,13]
  - [] => []
  - [13,1,14,11,3] => [13,1,11,3]
- k=3
  - [18,21,6,27] => []
  - [2,16,10,13,8,11] => [2,16,10,13,8,11]
  - [5,16,18,14,0] => [5,16,14]
- k=5
  - [6,10,30,8,25,45,20] => [6,8]
  - [10] => []
  - [] => []


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
  - [4,15,14,7] => [4,15,14,7,4,15,14,7]
  - [16,3,12,9] => [16,3,12,9,16,3,12,9]
  - [11,9,2,5,11] => [11,9,2,5,11,11,9,2,5,11]
- k=3
  - [14] => [14,14,14]
  - [16,0] => [16,0,16,0,16,0]
  - [0,16,1,11] => [0,16,1,11,0,16,1,11,0,16,1,11]
- k=5
  - [15,6,13] => [15,6,13,15,6,13,15,6,13,15,6,13,15,6,13]
  - [1,12,7,7] => [1,12,7,7,1,12,7,7,1,12,7,7,1,12,7,7,1,12,7,7]
  - [1,8,3,6,8] => [1,8,3,6,8,1,8,3,6,8,1,8,3,6,8,1,8,3,6,8,1,8,3,6,8]




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
  - [2,11,1,11,14] => [2,11,2,11,14]
  - [] => []
  - [2,9,10,5] => [2,9,10,5]
- k=2, n=10
  - [] => []
  - [2,2] => [10,10]
  - [12,2,10,11,15,2] => [12,10,10,11,15,10]
- k=3, n=-2
  - [0,9,1,7,10,13,1] => [0,9,1,7,10,13,1]
  - [6,3,10] => [6,-2,10]
  - [3,3] => [-2,-2]
- k=5, n=0
  - [5] => [0]
  - [9,7,5] => [9,7,0]
  - [6,11,7] => [6,11,7]




### replace-all-with-index-k (parametric)

`replace-all-with-index-k` replaces all elements of the list with the `k`-th number of the list.

Examples:
- k=1
  - [15,1,14,14,0,7] => [15,15,15,15,15,15]
  - [14,2,11,13,1] => [14,14,14,14,14]
  - [9,16,5,1,3] => [9,9,9,9,9]
- k=2
  - [3,1,15] => [1,1,1]
  - [6,9] => [9,9]
  - [11,7] => [7,7]
- k=3
  - [0,11,6,14,9,14,1,6,11,8] => [6,6,6,6,6,6,6,6,6,6]
  - [2,0,4,8,16,7,8,5] => [4,4,4,4,4,4,4,4]
  - [4,13,8,0,15] => [8,8,8,8,8]
- k=5
  - [11,1,11,15,10] => [10,10,10,10,10]
  - [4,1,6,0,16,12,7,15,15,9] => [16,16,16,16,16,16,16,16,16,16]
  - [9,16,16,7,9,2,0,7,2,1,3] => [9,9,9,9,9,9,9,9,9,9,9]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Examples:
- k=1, n=2
  - [15] => [2]
  - [4,0,10,6,12] => [2,0,10,6,12]
  - [15,11] => [2,11]
- k=2, n=10
  - [10,5,13,10,1,15,16] => [10,10,13,10,1,15,16]
  - [3,10,9] => [3,10,9]
  - [12,12,14,16,6,13,10,0] => [12,10,14,16,6,13,10,0]
- k=3, n=-2
  - [5,1,15,8,10,14,10,16,5,5] => [5,1,-2,8,10,14,10,16,5,5]
  - [2,14,16,15,9,6,14,1,2] => [2,14,-2,15,9,6,14,1,2]
  - [9,2,14,14,0,8,15,0] => [9,2,-2,14,0,8,15,0]
- k=5, n=0
  - [0,13,8,12,15,14,15,7,2,9,3,4] => [0,13,8,12,0,14,15,7,2,9,3,4]
  - [3,4,5,10,7,4,11,2,16,6] => [3,4,5,10,0,4,11,2,16,6]
  - [3,2,11,2,13,14,16,14,7] => [3,2,11,2,0,14,16,14,7]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### replace-k-with-n (parametric)

`replace-k-with-n` returns `n` if supplied `k`, otherwise returns the given number.

Examples:
- k=1, n=2
  - 10 => 10
  - 6 => 6
  - 1 => 2
- k=2, n=10
  - 12 => 12
  - 5 => 5
  - 14 => 14
- k=3, n=-2
  - 3 => -2
  - 1 => 1
  - 15 => 15
- k=5, n=0
  - 7 => 7
  - 5 => 0
  - 3 => 3




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
  - [15,2] => [2,15]
  - [15,13,3,7] => [7,15,13,3]
- k=3
  - [4] => [4]
  - [5,16,14,15,13,0] => [15,13,0,5,16,14]
  - [6,6] => [6,6]
- k=-2
  - [7,12,2] => [2,7,12]
  - [11,5,3,14] => [3,14,11,5]
  - [] => []
- k=10
  - [8,1,13] => [13,8,1]
  - [5,0,8,1] => [8,1,5,0]
  - [] => []




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Examples:
- k=2, n=2
  - [0,15,12,5,3,6,15] => [15,12]
  - [7,1,13,7,1] => [1,13]
  - [10,10,12,2,1] => [10,12]
- k=2, n=3
  - [2,2,8,10,6,6,3,6,13] => [2,8,10]
  - [7,15,1,15,14,3,2,13,16,16,14] => [15,1,15]
  - [3,3,1,11,11,8,13,7,16,6] => [3,1,11]
- k=3, n=3
  - [11,14,7,16,9,0,8,0,9,12] => [7,16,9]
  - [13,7,2,3,6,10,3] => [2,3,6]
  - [5,2,9,16,2,13,0,16,5,14,6,10,13,5] => [9,16,2]
- k=3, n=4
  - [9,4,2,9,11,4,13,12,3,5,10,12,15,15] => [2,9,11,4]
  - [2,1,9,15,0,9,6,13,9,11,2] => [9,15,0,9]
  - [14,16,2,9,16,10,0,3,5,8,14,14,7] => [2,9,16,10]


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
  - [14,2,9,15] => [14,2]
  - [5,6,13] => [5,6]
  - [16,15,2,5,5,16,1,2] => [16,15]
- k=3
  - [4,8,7,14] => [4,8,7]
  - [1,14,4,12,6,5,15,0,7,5] => [1,14,4]
  - [14,16,0,10,1,14] => [14,16,0]
- k=5
  - [2,12,1,6,10] => [2,12,1,6,10]
  - [1,16,2,8,7,3,14] => [1,16,2,8,7]
  - [11,2,12,5,8,15,16,6,11,16,10] => [11,2,12,5,8]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




