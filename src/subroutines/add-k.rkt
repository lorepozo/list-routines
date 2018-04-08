#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length))
(define params '((k . (int))))

(define description "adds `k` to each element.")
(define deps '())

(define example-params
  '(((k . 1))
    ((k . 2))
    ((k . 3))
    ((k . -2))
    ((k . 10))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (map (λ (x) (+ x k)) l)))

(define generate (generate-many))
