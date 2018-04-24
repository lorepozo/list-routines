#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list elements))
(define params '())

(define description "removes all duplicates, keeping only the first occurrence.")
(define deps '())

(define example-params null)
(define examples '((1 1 1) (2 5 4 2 2 0 5 1 1)))

(define (evaluate l params) (remove-duplicates l))

(define generate (generate-many))
