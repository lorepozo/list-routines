#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require math/number-theory)
(require "../prelude.rkt")

(define input '(int (at-least 3)))
(define output '(positive))
(define params '())

(define description "returns the largest prime number less than the given number.")
(define deps '())

(define example-params null)
(define examples '(3 4 7 8 13 20))

(define (evaluate i params) (prev-prime i))

(define generate (generate-many
  (λ _ (random 3 30))))
