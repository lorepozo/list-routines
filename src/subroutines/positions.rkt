#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list each-nonnegative))
(define params '())

(define description "gets the positions of nonzero list elements.")
(define deps '())

(define example-params '(()))

(define examples '((0 1 1) (0) (1 0 0 1)))

(define (evaluate l params) (filter-map (λ (x i) (if (= x 0) #f i)) l (range (length l))))

(define generate (generate-many))
