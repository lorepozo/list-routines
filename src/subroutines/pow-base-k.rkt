#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list each-nonnegative))
(define output '(int-list same-length))
(define params '((k . (int))))

(define description "exponentiates each element with base `k`. Elements must be nonnegative so the results are integers.")
(define deps '("mult-k"))

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 4))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (map (λ (x) (expt k x)) l)))

(define generate (generate-many
  (λ (_ len)
     (random-list #:len len #:max 12))))
