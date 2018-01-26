#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "returns a list of numbers from 0 up to – exclusively – the given number.")
(define deps '())

(define examples '(0 1 2 3 7))

(define (validate i) (integer? i))
(define (evaluate i) (range i))

(define generate (generate-many
  (λ (params)
   (random 10))))
