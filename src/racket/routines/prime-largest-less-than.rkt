#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")
(require math/number-theory)

(define is-parametric #f)
(define description "returns the largest prime number less than the given number.")
(define deps '())

(define examples '(3 4 7 8 13 20))

(define (validate i) (and (integer? i) (> i 2) (< i 1000)))
(define (evaluate i) (prev-prime i))

(define generate (generate-many
  (λ (params)
   (random 3 30))))
