#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int))
(define params '())

(define description "adds all elements of the list.")
(define deps '())

(define example-params null)
(define examples '((1 2 3) (0) (1 1 2 1)))

(define (evaluate l params) (foldl + 0 l))

(define generate (generate-many))
