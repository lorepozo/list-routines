#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list no-smaller elements))
(define params '())

(define description "duplicates each element")
(define deps '())

(define example-params null)
(define examples '((0) (7 2 4)))

(define (evaluate l params) (append-map (λ (e) (list e e)) l))

(define generate (generate-many))
