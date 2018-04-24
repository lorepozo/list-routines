#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length))
(define params '((k . (positive))))

(define description "expresses each element in the ring of integers modulo `k`.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 10))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (map (λ (x) (modulo x k)) l)))

(define generate (generate-many))
