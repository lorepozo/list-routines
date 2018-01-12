# Routine documentation

* TOC
{:toc}

### add-k (parametric)

`add-k` adds `k` to each element.

Examples:
- k=2
  - [9,1,4,13] => [11,3,6,15]
  - [2,14] => [4,16]
  - [0,2,11,3,15,14,13] => [2,4,13,5,17,16,15]
- k=3
  - [15,5] => [18,8]
  - [] => []
  - [1,16,2,14] => [4,19,5,17]
- k=10
  - [3,8,5,0,6] => [13,18,15,10,16]
  - [12,4,2,2] => [22,14,12,12]
  - [0,3,3,6,4,5,15] => [10,13,13,16,14,15,25]




### append-k (parametric)

`append-k` appends the number `k`.

Examples:
- k=2
  - [0,9] => [0,9,2]
  - [13,3,7] => [13,3,7,2]
  - [11,10,1,13,5] => [11,10,1,13,5,2]
- k=3
  - [14] => [14,3]
  - [8,2] => [8,2,3]
  - [10] => [10,3]
- k=10
  - [0,2,6,16,12,1,3] => [0,2,6,16,12,1,3,10]
  - [0,10,13,8,6] => [0,10,13,8,6,10]
  - [1] => [1,10]




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

`count-k` counters occurrences of the number `k`.

Examples:
- k=2
  - [3,10,3,5] => 0
  - [6] => 0
  - [13,9,13,4,8,10] => 0
- k=3
  - [13] => 0
  - [7,6,3,4] => 1
  - [13,1,5,13,12,14,0] => 0
- k=10
  - [16,8,10,15,9] => 1
  - [0,4,9,2,2] => 0
  - [12,11,0,5,1,8] => 0




### dedup

`dedup` removes adjacent duplicates.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,2,0,5,1]




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




### head-in-tail

`head-in-tail` checks if the first number occurs in the rest of the list.

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

### head

`head` gets the first number in the list.

Examples:
- [5,9,1] => 5
- [12,4] => 12
- [2,3,6,7] => 2




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

### keep-mod-head

`keep-mod-head` gets elements after the first number which are divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [3,6,9]
- [4,2,6,10,8,12] => [8,12]
- [1,2,3] => [2,3]


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [evens](#evens)
- [odds](#odds)

### len

`len` gets the length of the list.

Examples:
- [1,2,3] => 3
- [0] => 1
- [1,1,2,1] => 4




### mult-k (parametric)

`mult-k` multiples each element by `k`.

Examples:
- k=2
  - [5,12,2] => [10,24,4]
  - [14,10,13,10,9] => [28,20,26,20,18]
  - [12] => [24]
- k=3
  - [] => []
  - [6,15,1,7,7,15] => [18,45,3,21,21,45]
  - [15,4,6,11] => [45,12,18,33]
- k=10
  - [0,7,6,5,12] => [0,70,60,50,120]
  - [11,11] => [110,110]
  - [5,8,12,11] => [50,80,120,110]




### odds

`odds` gets only even numbers of the list.

Examples:
- [1,1,3] => [1,1,3]
- [2,5,4,2,0,5,1,1] => [5,5,1,1]




### prepend-k (parametric)

`prepend-k` prepends the number `k`.

Examples:
- k=2
  - [8,15,6,16,15] => [2,8,15,6,16,15]
  - [6,10,0,7,7] => [2,6,10,0,7,7]
  - [14,11] => [2,14,11]
- k=3
  - [] => [3]
  - [] => [3]
  - [15,1,8] => [3,15,1,8]
- k=10
  - [0,4] => [10,0,4]
  - [3,10,0,11,10,14] => [10,3,10,0,11,10,14]
  - [9,0,12,16,7,11] => [10,9,0,12,16,7,11]




### remove-mod-head

`remove-mod-head` gets elements after the first number which are not divisible by the first number.

Examples:
- [3,1,3,4,7,6,9,2] => [1,4,7,2]
- [4,2,6,10,8,12] => [2,6,10]
- [1,2,3] => []


Conceptual dependencies:
- [head](#head)
- [tail](#tail)
- [evens](#evens)
- [odds](#odds)

### tail

`tail` gets numbers in the list after the first number.

Examples:
- [5,9,1] => [9,1]
- [12,4] => [4]
- [2,3,6,7] => [3,6,7]




### uniq

`uniq` removes all duplicates, keeping only the first occurrence.

Examples:
- [1,1,1] => [1]
- [2,5,4,2,2,0,5,1,1] => [2,5,4,0,1]




