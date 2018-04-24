#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int))
(define output '(int-list each-nonnegative))
(define params '())

(define description "returns a list of numbers from 0 up to – exclusively – the given number.")
(define deps '())

(define example-params null)
(define examples '(0 1 2 3 7))

(define (evaluate i params) (range (min i 100)))

(define generate (generate-many
  (λ _ (random 10))))
