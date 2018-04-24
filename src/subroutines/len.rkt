#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(nonnegative))
(define params '())

(define description "gets the length of the list.")
(define deps '("empty"))

(define example-params null)
(define examples '((1 2 3) (0) (1 1 2 1)))

(define (evaluate l params) (length l))

(define generate (generate-many))
