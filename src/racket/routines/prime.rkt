#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")
(require math/number-theory)

(define is-parametric #f)
(define description "returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.")
(define deps '())

(define examples '(1 2 3 7))

(define (validate i) (and (integer? i) (positive? i) (< i 1000)))
(define (evaluate i) (nth-prime (sub1 i)))

(define generate (generate-many
  (λ (params)
   (random 1 15))))
