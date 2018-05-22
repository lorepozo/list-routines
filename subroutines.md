# Subroutine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Types:
- Input: int-list
- Output: int-list + same-length
- Param k: int


Examples:
- k=1
    - [12,12,1] => [13,13,2]
    - [15] => [16]
    - [13,12,2] => [14,13,3]
- k=2
    - [14,16,4,2,0,15] => [16,18,6,4,2,17]
    - [1,8] => [3,10]
    - [12,8,12,5,7] => [14,10,14,7,9]
- k=3
    - [7,8] => [10,11]
    - [5] => [8]
    - [] => []
- k=-2
    - [3] => [1]
    - [9] => [7]
    - [10,5,1,7,15,16,10] => [8,3,-1,5,13,14,8]
- k=10
    - [14] => [24]
    - [11,6,1,12,6] => [21,16,11,22,16]
    - [] => []




### append-k (parametric)

`append-k` appends the number `k`.

Types:
- Input: int-list
- Output: int-list + length-add1
- Param k: int


Examples:
- k=2
    - [5,6,5] => [5,6,5,2]
    - [8,13] => [8,13,2]
    - [16,7,0,8,3] => [16,7,0,8,3,2]
- k=3
    - [6,14,4,12] => [6,14,4,12,3]
    - [0] => [0,3]
    - [15,9] => [15,9,3]
- k=-2
    - [4,4] => [4,4,-2]
    - [0,7,5,1,5] => [0,7,5,1,5,-2]
    - [4,6] => [4,6,-2]
- k=10
    - [16,0,4,16,5] => [16,0,4,16,5,10]
    - [4,14,0,5,3] => [4,14,0,5,3,10]
    - [9,10,3,10] => [9,10,3,10,10]




### count-k (parametric)

`count-k` counts occurrences of the number `k`.

Types:
- Input: int-list
- Output: nonnegative
- Param k: int


Examples:
- k=2
    - [3,2,13,10,15] => 1
    - [15,0,15] => 0
    - [] => 0
- k=3
    - [3,1,14,7,14] => 1
    - [12,0,16] => 0
    - [3,3,3,3] => 4
- k=10
    - [10,10,10,10,10] => 5
    - [16,0,10,11,0] => 1
    - [10,16,10,14,6,1] => 2




### dedup 

`dedup` removes adjacent duplicates.

Types:
- Input: int-list
- Output: int-list + elements


Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




### drop-k (parametric)

`drop-k` drops the first `k` numbers of the list.

Types:
- Input: int-list + (length-at-least k)
- Output: int-list + elements
- Param k: nonnegative


Examples:
- k=2
    - [2,8,16,9,0,14,4,9] => [16,9,0,14,4,9]
    - [5,4,1,12,11,16] => [1,12,11,16]
    - [7,9,2] => [2]
- k=3
    - [2,0,11,6,4,10] => [6,4,10]
    - [5,5,10,1,15,4,14] => [1,15,4,14]
    - [2,11,4,1,15,1,7,1] => [1,15,1,7,1]
- k=5
    - [14,11,7,14,8,13,2] => [13,2]
    - [7,6,3,4,12,10,14,1,7,9,13,3] => [10,14,1,7,9,13,3]
    - [12,1,6,13,16,9,8,11] => [9,8,11]




### dup 

`dup` duplicates each element

Types:
- Input: int-list
- Output: int-list + no-smaller + elements


Examples:
- [0] => [0,0]
- [7,2,4] => [7,7,2,2,4,4]




### empty 

`empty` determines if the list is empty.

Types:
- Input: int-list
- Output: bool


Examples:
- [1,2,3] => false
- [] => true
- [0] => false
- [1,1,2,1] => false
- [] => true




### fibonacci 

`fibonacci` returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.

Types:
- Input: nonnegative
- Output: nonnegative


Examples:
- 2 => 1
- 4 => 3
- 6 => 8
- 9 => 34




### has-k (parametric)

`has-k` checks if the number `k` occurs in the list.

Types:
- Input: int-list
- Output: bool
- Param k: int


Examples:
- k=2
    - [5] => false
    - [5,16,2] => true
    - [2,5] => true
- k=3
    - [3] => true
    - [3,3,3,3,3,3,3] => true
    - [3,3,12,3,13,0] => true
- k=10
    - [11,10,12] => true
    - [4,13,10] => true
    - [8,10,3,4] => true




### head 

`head` gets the first element of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int + element


Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### identify-geq-k (parametric)

`identify-geq-k` replaces numbers greater than or equal to `k` with 1, leaving all others to 0.

Types:
- Input: int-list
- Output: int-list + same-length + binary
- Param k: int


Examples:
- k=2
    - [0,14,14,0,0,0] => [0,1,1,0,0,0]
    - [0,0,0,0,0,0,0] => [0,0,0,0,0,0,0]
    - [15,12,7,8,0] => [1,1,1,1,0]
- k=3
    - [11] => [1]
    - [5,1] => [1,0]
    - [4] => [1]
- k=7
    - [7] => [1]
    - [1,10,13,10,10,5,6] => [0,1,1,1,1,0,0]
    - [8] => [1]




### identify-is-mod-k (parametric)

`identify-is-mod-k` replaces mulitples of `k` with 1, leaving all others to 0.

Types:
- Input: int-list
- Output: int-list + same-length + binary
- Param k: int + nonzero


Examples:
- k=2
    - [15,2,4,2] => [0,1,1,1]
    - [13,2,15,2] => [0,1,0,1]
    - [11,2,2,2,2,2,2] => [0,1,1,1,1,1,1]
- k=3
    - [4,14,14,14,3,5,10] => [0,0,0,0,1,0,0]
    - [] => []
    - [3,9,3,3] => [1,1,1,1]
- k=7
    - [] => []
    - [8,7,14,7,15,7] => [0,1,1,1,0,1]
    - [15,12,7,0,8,7] => [0,0,1,1,0,1]




### identify-is-prime 

`identify-is-prime` replaces prime numbers with 1, leaving all others to 0.

Types:
- Input: int-list
- Output: int-list + same-length + binary


Examples:
- [2] => [1]
- [2,0] => [1,0]
- [5,11] => [1,1]
- [5,11,12] => [1,1,0]
- [2,3,4,5,7,9] => [1,1,0,1,1,0]




### identify-k (parametric)

`identify-k` replaces occurences of `k` with 1, leaving all others to 0.

Types:
- Input: int-list
- Output: int-list + same-length + binary
- Param k: int


Examples:
- k=1
    - [15,7,6,5,9,5] => [0,0,0,0,0,0]
    - [4,10,7,16,11] => [0,0,0,0,0]
    - [1] => [1]
- k=2
    - [12,15,2,13,14,11] => [0,0,1,0,0,0]
    - [9,2,2] => [0,1,1]
    - [2,7,2,2,2,2] => [1,0,1,1,1,1]
- k=3
    - [1,3,3,3,3] => [0,1,1,1,1]
    - [15,12,4,9,12] => [0,0,0,0,0]
    - [3,1,3,3,10,15,3] => [1,0,1,1,0,0,1]
- k=-2
    - [10,7,1,3,8,6,3] => [0,0,0,0,0,0,0]
    - [-2,-2,-2,-2,-2] => [1,1,1,1,1]
    - [4,3,8,1,0,10,1] => [0,0,0,0,0,0,0]
- k=10
    - [10] => [1]
    - [11,2] => [0,0]
    - [] => []




### index-k (parametric)

`index-k` get the `k`-th number in the list (starting at 1).

Types:
- Input: int-list + (length-at-least k)
- Output: int + element
- Param k: positive


Examples:
- k=2
    - [9,3,6,12,12,12] => 3
    - [4,3,15] => 3
    - [3,15,9,0,11] => 15
- k=3
    - [11,1,15,9,16,13,2,3,9] => 15
    - [15,14,1] => 1
    - [12,13,11,8,15,8,15,1,6,1] => 11


Conceptual dependencies:
- [head](#head)

### intersperse-k (parametric)

`intersperse-k` inserts `k` between each element of the list.

Types:
- Input: int-list
- Output: int-list + no-smaller
- Param k: int


Examples:
- k=1
    - [10] => [10]
    - [8,12,16,2,5,7] => [8,1,12,1,16,1,2,1,5,1,7]
    - [15,12,10,3,3,4,11] => [15,1,12,1,10,1,3,1,3,1,4,1,11]
- k=10
    - [3,8,9,13] => [3,10,8,10,9,10,13]
    - [] => []
    - [1,14,4] => [1,10,14,10,4]
- k=-2
    - [2,8,5,10,4,7,12] => [2,-2,8,-2,5,-2,10,-2,4,-2,7,-2,12]
    - [5,10] => [5,-2,10]
    - [3,7,5,9,16,7,2] => [3,-2,7,-2,5,-2,9,-2,16,-2,7,-2,2]
- k=0
    - [3,12,5,8] => [3,0,12,0,5,0,8]
    - [14,8,10,8,1] => [14,0,8,0,10,0,8,0,1]
    - [13,6,11,9,5,3] => [13,0,6,0,11,0,9,0,5,0,3]




### is-evens 

`is-evens` checks if all numbers of the list are even.

Types:
- Input: int-list
- Output: bool


Examples:
- [2,0,4] => true
- [2,5,4,2,0,5,1,1] => false




### is-mod-k (parametric)

`is-mod-k` checks if all numbers of the list are divisible by `k`.

Types:
- Input: int-list
- Output: bool
- Param k: nonzero


Examples:
- k=2
    - [32,22,16] => true
    - [28,6,18,18,6,12] => true
    - [15,1,6,10] => false
- k=3
    - [9,45,0] => true
    - [2,10,3,5,14,8,10] => false
    - [1,2,15,15,3,13] => false
- k=5
    - [15] => true
    - [1,7,13,6,16,8] => false
    - [12,15,8,2,15,8] => false


Conceptual dependencies:
- [is-evens](#is-evens)
- [is-odds](#is-odds)
- [identify-is-mod-k](#identify-is-mod-k-parametric)

### is-odds 

`is-odds` checks if all numbers of the list are odd.

Types:
- Input: int-list
- Output: bool


Examples:
- [2,0,4] => false
- [2,5,4,2,0,5,1,1] => false




### is-primes 

`is-primes` checks if all numbers of the list are prime (up to 200).

Types:
- Input: int-list
- Output: bool


Examples:
- [2] => true
- [2,0] => false
- [5,11] => true
- [5,11,12] => false


Conceptual dependencies:
- [identify-is-prime](#identify-is-prime)

### is-squares 

`is-squares` checks if all numbers of the list are square.

Types:
- Input: int-list
- Output: bool


Examples:
- [25] => true
- [3] => false
- [1,4] => true
- [1,4,9] => true
- [1,4,9,15] => false




### keep-mod-k (parametric)

`keep-mod-k` gets elements which are divisible by `k`.

Types:
- Input: int-list
- Output: int-list + elements
- Param k: int + nonzero


Examples:
- k=2
    - [] => []
    - [13,11,16,15,13,16,9] => [16,16]
    - [5,2,7,15] => [2]
- k=3
    - [4,5] => []
    - [11,15,3,6,24,21] => [15,3,6,24,21]
    - [9] => [9]
- k=5
    - [0,3] => [0]
    - [2,12,16,5,1,4,4] => [5]
    - [16,0] => [0]


Conceptual dependencies:
- [is-evens](#is-evens)
- [is-odds](#is-odds)

### kth-largest (parametric)

`kth-largest` gets the `k`-th largest element of the list.

Types:
- Input: int-list + (length-at-least k)
- Output: int + element
- Param k: positive


Examples:
- k=2
    - [12,7,15] => 12
    - [12,13,1,12] => 12
    - [3,8,9,6,12,7,12,9] => 12
- k=3
    - [9,10,11,2,12,7,11,1] => 11
    - [0,7,4,15] => 4
    - [11,1,5,1,5,13] => 5


Conceptual dependencies:
- [max](#max)

### kth-smallest (parametric)

`kth-smallest` gets the `k`-th smallest element of the list.

Types:
- Input: int-list + (length-at-least k)
- Output: int + element
- Param k: positive


Examples:
- k=2
    - [0,6,8,1,7] => 1
    - [2,1,4] => 2
    - [11,9,3,1,8] => 3
- k=3
    - [3,10,15,10,0,1] => 3
    - [11,9,1,13,0,9,6,11,1,9] => 1
    - [7,7,13,3,8,7,2] => 7


Conceptual dependencies:
- [min](#min)

### last 

`last` gets the last element of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int + element


Examples:
- [1,2,3] => 3
- [0] => 0
- [1,1,2,1] => 1




### len 

`len` gets the length of the list.

Types:
- Input: int-list
- Output: nonnegative


Examples:
- [1,2,3] => 3
- [0] => 1
- [1,1,2,1] => 4


Conceptual dependencies:
- [empty](#empty)

### max 

`max` gets the largest element of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int + element


Examples:
- [1,2,3] => 3
- [0] => 0
- [1,1,2,1] => 2




### min 

`min` gets the smallest element of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int + element


Examples:
- [1,2,3] => 1
- [0] => 0
- [1,1,2,1] => 1




### modulo-k (parametric)

`modulo-k` expresses each element in the ring of integers modulo `k`.

Types:
- Input: int-list
- Output: int-list + same-length
- Param k: positive


Examples:
- k=2
    - [9,7] => [1,1]
    - [0,10,14,9] => [0,0,0,1]
    - [14,3,12,2] => [0,1,0,0]
- k=3
    - [7,4,4] => [1,1,1]
    - [3,6,0,4,4,6] => [0,0,0,1,1,0]
    - [] => []
- k=10
    - [2] => [2]
    - [6,7,6] => [6,7,6]
    - [3,1,16,10,4,12,5] => [3,1,6,0,4,2,5]




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Types:
- Input: int-list
- Output: int-list + same-length
- Param k: int


Examples:
- k=2
    - [5,3,3,8,10,10] => [10,6,6,16,20,20]
    - [15,2] => [30,4]
    - [2,10,5,3,0,14] => [4,20,10,6,0,28]
- k=3
    - [13,2,4,11,11] => [39,6,12,33,33]
    - [1,0] => [3,0]
    - [8,2,0,8,10,7] => [24,6,0,24,30,21]
- k=-2
    - [5] => [-10]
    - [12] => [-24]
    - [16,13,16,14] => [-32,-26,-32,-28]
- k=10
    - [16,7,0,5,1,16,10] => [160,70,0,50,10,160,100]
    - [8,2,13,16] => [80,20,130,160]
    - [4,11,13,2,13,0] => [40,110,130,20,130,0]




### pop 

`pop` removes the last element of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int-list + length-sub1


Examples:
- [1,2,3] => [1,2]
- [0] => []
- [1,1,2,1] => [1,1,2]




### positions 

`positions` gets the positions of nonzero list elements.

Types:
- Input: int-list
- Output: int-list + each-nonnegative


Examples:
- [0,1,1] => [1,2]
- [0] => []
- [1,0,0,1] => [0,3]




### pow-base-k (parametric)

`pow-base-k` exponentiates each element with base `k`. Elements must be nonnegative so the results are integers.

Types:
- Input: int-list + each-nonnegative
- Output: int-list + same-length
- Param k: int


Examples:
- k=2
    - [8,7,5,0,8,5] => [256,128,32,1,256,32]
    - [10,8,0,10,6,9,7] => [1024,256,1,1024,64,512,128]
    - [] => []
- k=3
    - [4,5,3,7,4,9,11] => [81,243,27,2187,81,19683,177147]
    - [4,0] => [81,1]
    - [2,6] => [9,729]
- k=4
    - [5,6,2] => [1024,4096,16]
    - [4] => [256]
    - [5] => [1024]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### pow-k (parametric)

`pow-k` exponentiates each element by `k` (e.g. squaring, cubing).

Types:
- Input: int-list
- Output: int-list + same-length
- Param k: positive


Examples:
- k=2
    - [8,2,3,11,9] => [64,4,9,121,81]
    - [10] => [100]
    - [12,12,0,9,12] => [144,144,0,81,144]
- k=3
    - [9,3,15,11,4,14] => [729,27,3375,1331,64,2744]
    - [3,8,9,16,6,13] => [27,512,729,4096,216,2197]
    - [9,11,5] => [729,1331,125]
- k=4
    - [0,8,7,7,4,4] => [0,4096,2401,2401,256,256]
    - [1,9,7] => [1,6561,2401]
    - [11,6] => [14641,1296]


Conceptual dependencies:
- [mult-k](#mult-k-parametric)

### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Types:
- Input: int-list
- Output: int-list + length-add1
- Param k: int


Examples:
- k=2
    - [2,6] => [2,2,6]
    - [7,0,10,14,4,8] => [2,7,0,10,14,4,8]
    - [12,8,11,4,4] => [2,12,8,11,4,4]
- k=3
    - [6,13,8,12,6] => [3,6,13,8,12,6]
    - [1,12,9,1,2] => [3,1,12,9,1,2]
    - [12,4,7] => [3,12,4,7]
- k=-2
    - [15] => [-2,15]
    - [10,2,10,7,11,7,13] => [-2,10,2,10,7,11,7,13]
    - [15,8,3,5,8,10] => [-2,15,8,3,5,8,10]
- k=10
    - [2,7,0,2] => [10,2,7,0,2]
    - [15,7,5,0] => [10,15,7,5,0]
    - [14,12,11] => [10,14,12,11]




### prime 

`prime` returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.

Types:
- Input: positive
- Output: positive


Examples:
- 1 => 2
- 2 => 3
- 3 => 5
- 7 => 17




### prime-largest-less-than 

`prime-largest-less-than` returns the largest prime number less than the given number.

Types:
- Input: int + (at-least 3)
- Output: positive


Examples:
- 3 => 2
- 4 => 3
- 7 => 5
- 8 => 7
- 13 => 11
- 20 => 19




### product 

`product` multiplies all elements of the list.

Types:
- Input: int-list + (length-at-least 1)
- Output: int


Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 2




### range 

`range` returns a list of numbers from 0 up to – exclusively – the given number.

Types:
- Input: int
- Output: int-list + each-nonnegative


Examples:
- 0 => []
- 1 => [0]
- 2 => [0,1]
- 3 => [0,1,2]
- 7 => [0,1,2,3,4,5,6]




### remove-mod-k (parametric)

`remove-mod-k` gets elements which are not divisible by `k`.

Types:
- Input: int-list
- Output: int-list
- Param k: int + nonzero


Examples:
- k=2
    - [18,4,0,18,4,13,12] => [13]
    - [4] => []
    - [6,8,0,3] => [3]
- k=3
    - [7,3,8] => [7,8]
    - [27,15,12] => []
    - [12,0,16,27,6] => [16]
- k=5
    - [40] => []
    - [1,16,9] => [1,16,9]
    - [30] => []


Conceptual dependencies:
- [is-evens](#is-evens)
- [is-odds](#is-odds)

### repeat-k (parametric)

`repeat-k` repeats the given list `k` times.

Types:
- Input: int-list
- Output: int-list + no-smaller + elements
- Param k: positive


Examples:
- k=2
    - [14] => [14,14]
    - [8,2] => [8,2,8,2]
    - [10,15,11] => [10,15,11,10,15,11]
- k=3
    - [15,16,10] => [15,16,10,15,16,10,15,16,10]
    - [2,7,4] => [2,7,4,2,7,4,2,7,4]
    - [4,14,2,15,7] => [4,14,2,15,7,4,14,2,15,7,4,14,2,15,7]
- k=5
    - [12,5,0,9,7] => [12,5,0,9,7,12,5,0,9,7,12,5,0,9,7,12,5,0,9,7,12,5,0,9,7]
    - [1,9] => [1,9,1,9,1,9,1,9,1,9]
    - [7,14,10,15,3] => [7,14,10,15,3,7,14,10,15,3,7,14,10,15,3,7,14,10,15,3,7,14,10,15,3]




### replace-all-k-with-n (parametric)

`replace-all-k-with-n` replaces all occurences of `k` in the list with `n`.

Types:
- Input: int-list
- Output: int-list + same-length
- Param k: int
- Param n: int


Examples:
- k=1, n=2
    - [] => []
    - [10,16,1,14,14,13,1] => [10,16,2,14,14,13,2]
    - [14,1,1,16,12] => [14,2,2,16,12]
- k=2, n=10
    - [2,2,2,15] => [10,10,10,15]
    - [9,7,9,6,2,2] => [9,7,9,6,10,10]
    - [10] => [10]
- k=3, n=-2
    - [3] => [-2]
    - [16,3,3,3] => [16,-2,-2,-2]
    - [5,9] => [5,9]
- k=5, n=0
    - [5,5,5,5] => [0,0,0,0]
    - [5,5,14,16] => [0,0,14,16]
    - [16,0,12,1] => [16,0,12,1]




### replace-index-k-with-n (parametric)

`replace-index-k-with-n` replaces the `k`-th number in the list with `n`.

Types:
- Input: int-list + (length-at-least k)
- Output: int-list + same-length
- Param k: positive
- Param n: int


Examples:
- k=1, n=2
    - [9,1] => [2,1]
    - [16,15,7,14,13,5,16] => [2,15,7,14,13,5,16]
    - [11,10,4,9,2] => [2,10,4,9,2]
- k=2, n=10
    - [11,6] => [11,10]
    - [6,5,8] => [6,10,8]
    - [13,10,13,5,2,15,9,12,10] => [13,10,13,5,2,15,9,12,10]
- k=3, n=-2
    - [5,4,11,5,16,0,14] => [5,4,-2,5,16,0,14]
    - [16,9,14,10,15] => [16,9,-2,10,15]
    - [11,7,16,1,13,10,4,2,15] => [11,7,-2,1,13,10,4,2,15]
- k=5, n=0
    - [9,11,4,12,8,5] => [9,11,4,12,0,5]
    - [8,3,16,6,3,0,10,13,16,4,7,3] => [8,3,16,6,0,0,10,13,16,4,7,3]
    - [13,10,14,3,1,2,10,10,10,6,7] => [13,10,14,3,0,2,10,10,10,6,7]


Conceptual dependencies:
- [index-k](#index-k-parametric)

### reverse 

`reverse` reverses the list.

Types:
- Input: int-list
- Output: int-list + same-length + elements


Examples:
- [2,0,4] => [4,0,2]
- [2,5,4,2,0,5,1,1] => [1,1,5,0,2,4,5,2]




### rotate-k (parametric)

`rotate-k` shifts number placements forward by `k` (shifts backward if `k` is negative).

Types:
- Input: int-list
- Output: int-list + same-length + elements
- Param k: int


Examples:
- k=1
    - [5,7,12,8,15,2] => [2,5,7,12,8,15]
    - [5,10,0,2,8] => [8,5,10,0,2]
    - [11,13,13,16,15,11,16] => [16,11,13,13,16,15,11]
- k=3
    - [1] => [1]
    - [8,3,16,7,2,9] => [7,2,9,8,3,16]
    - [15,7,16] => [15,7,16]
- k=-2
    - [7,15,14,14,15] => [14,14,15,7,15]
    - [16] => [16]
    - [] => []
- k=10
    - [8,9,5,10] => [5,10,8,9]
    - [2] => [2]
    - [10,4,8,10,1,3] => [8,10,1,3,10,4]




### slice-k-n (parametric)

`slice-k-n` gets `n` numbers starting with the `k`-th number in the list.

Types:
- Input: int-list + (length-at-least-sum '(k n 1))
- Output: int-list + elements
- Param k: positive
- Param n: nonnegative


Examples:
- k=2, n=2
    - [15,12,8,3,11,16,16,5,16,7] => [12,8]
    - [9,5,14,6,1,10,12] => [5,14]
    - [13,15,11,9,6,3,15] => [15,11]
- k=2, n=3
    - [16,10,2,4,7,16,12,14,1,14,13,6] => [10,2,4]
    - [1,0,3,10,3,16,3,0,7,4,3,8,0] => [0,3,10]
    - [2,16,3,8,14,1,0,15,2,13] => [16,3,8]
- k=3, n=3
    - [4,9,3,9,11,4,4,3,11,4,13] => [3,9,11]
    - [16,4,5,3,10,3,8,16,3,4] => [5,3,10]
    - [10,16,7,1,2,14,7,10,14,5,15,16,11] => [7,1,2]
- k=3, n=4
    - [3,13,2,1,13,6,16,14,1,10,1,4] => [2,1,13,6]
    - [6,14,4,12,4,16,7,7,4,2,11] => [4,12,4,16]
    - [14,11,3,8,5,5,16,6,15,6,2] => [3,8,5,5]


Conceptual dependencies:
- [index-k](#index-k-parametric)
- [take-k](#take-k-parametric)

### sort 

`sort` sorts the list.

Types:
- Input: int-list
- Output: int-list + same-length + elements


Examples:
- [2,0,4] => [0,2,4]
- [2,5,4,2,0,5,1,1] => [0,1,1,2,2,4,5,5]




### sum 

`sum` adds all elements of the list.

Types:
- Input: int-list
- Output: int


Examples:
- [1,2,3] => 6
- [0] => 0
- [1,1,2,1] => 5




### tail 

`tail` gets numbers in the list after the first number.

Types:
- Input: int-list + (length-at-least 1)
- Output: int-list + length-sub1 + elements


Examples:
- [5,9,1] => [9,1]
- [12,4] => [4]
- [2,3,6,7] => [3,6,7]




### take-k (parametric)

`take-k` gets the first `k` numbers of the list.

Types:
- Input: int-list + (length-at-least k)
- Output: int-list + elements
- Param k: nonnegative


Examples:
- k=2
    - [14,5,16,11,7,3,7,3] => [14,5]
    - [12,1,12,6,6,3,15] => [12,1]
    - [10,10,4,0,7,5] => [10,10]
- k=3
    - [8,1,7,11,14,7] => [8,1,7]
    - [2,14,6,16,0] => [2,14,6]
    - [7,10,12,10,10,10,16,12,5,0] => [7,10,12]
- k=5
    - [1,0,9,6,12,3,0,1,14,16] => [1,0,9,6,12]
    - [13,6,11,3,13,10,1,12,6,14] => [13,6,11,3,13]
    - [2,5,1,14,9,4,0,13,8,8,2,8] => [2,5,1,14,9]




### uniq 

`uniq` removes all duplicates, keeping only the first occurrence.

Types:
- Input: int-list
- Output: int-list + elements


Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




