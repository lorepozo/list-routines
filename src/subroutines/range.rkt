#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int))
(define output '(int-list each-non-negative))
(define params '())

(define description "returns a list of numbers from 0 up to – exclusively – the given number.")
(define deps '())

(define example-params '(()))

(define (evaluate i params) (range i))

(define generate (generate-many
  (λ _ (random 10))))
