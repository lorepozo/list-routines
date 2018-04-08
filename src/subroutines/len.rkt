#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(non-negative))
(define params '())

(define description "gets the length of the list.")
(define deps '("empty"))

(define example-params '(()))

(define examples '((1 2 3) (0) (1 1 2 1)))

(define (evaluate l params) (length l))

(define generate (generate-many))
