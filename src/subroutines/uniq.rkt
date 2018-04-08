#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list elements))
(define params '())

(define description "removes all duplicates, keeping only the first occurrence.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (remove-duplicates l))

(define generate (generate-many))
