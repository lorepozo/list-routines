#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length elements))
(define params '())

(define description "reverses the list.")
(define deps '())

(define example-params null)
(define examples '((2 0 4) (2 5 4 2 0 5 1 1)))

(define (evaluate l params) (reverse l))

(define generate (generate-many))
