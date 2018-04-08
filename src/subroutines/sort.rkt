#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length elements))
(define params '())

(define description "sorts the list.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (sort l <))

(define generate (generate-many))
