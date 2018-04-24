#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list length-add1))
(define params '((k . (int))))

(define description "appends the number `k`.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . -2))
    ((k . 10))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (append l (list k))))

(define generate (generate-many))
