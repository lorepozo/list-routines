#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list elements))
(define params '())

(define description "gets only even numbers of the list.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (filter (λ (x) (= (modulo x 2) 1)) l))

(define generate (generate-many))
