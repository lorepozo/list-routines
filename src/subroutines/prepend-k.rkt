#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list length-add1))
(define params '((k . (int))))

(define description "prepends the number `k`.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . -2))
    ((k . 10))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (cons k l)))

(define generate (generate-many))
