#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(non-negative))
(define params '())

(define description "adds all elements of the list.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (foldl + 0 l))

(define generate (generate-many))
