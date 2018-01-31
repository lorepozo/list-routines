#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")
(require math/number-theory)

(define is-parametric #f)
(define description "returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.")
(define deps '())

(define examples '(2 4 6 9))

(define (validate i) (and (integer? i) (nonnegative? i) (<= i 100)))
(define (evaluate i) (fibonacci i))

(define generate (generate-many
  (λ (params)
   (random 1 16))))
