#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list (length-at-least k)))
(define output '(int element))
(define params '((k . (positive))))

(define description "get the `k`-th number in the list (starting at 1).")
(define deps '("head"))

(define example-params
  '(((k . 2))
    ((k . 3))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (list-ref l (sub1 k))))

(define generate (generate-many
  #:len-valid (λ (len params)
                 (let ([k (cdr (assoc 'k params))])
                   (>= len k)))
  #:len-default (λ (params)
                 (let ([k (cdr (assoc 'k params))])
                   (random k (+ k 8))))))
