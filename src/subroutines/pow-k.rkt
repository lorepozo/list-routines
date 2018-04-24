#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length))
(define params '((k . (positive))))

(define description "exponentiates each element by `k` (e.g. squaring, cubing).")
(define deps '("mult-k"))

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 4))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (map (λ (x) (expt x k)) l)))

(define generate (generate-many))
