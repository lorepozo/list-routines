#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define primes '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79
                 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163
                 167 173 179 181 191 193 197 199))

(define input '(int-list))
(define output '(int-list same-length binary))
(define params '())

(define description "replaces prime numbers with 1, leaving all others to 0.")
(define deps '())

(define example-params null)
(define examples '((2) (2 0) (5 11) (5 11 12) (2 3 4 5 7 9)))

(define (evaluate l params)
  (map (λ (x) (if (not (not (member x primes))) 1 0)) l))

(define generate (generate-many))
