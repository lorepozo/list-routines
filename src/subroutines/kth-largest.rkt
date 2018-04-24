#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list (length-at-least k)))
(define output '(int element))
(define params '((k . (positive))))

(define description "gets the `k`-th largest element of the list.")
(define deps '("max"))

(define example-params
  '(((k . 2))
    ((k . 3))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (list-ref (sort l >) (sub1 k))))

(define generate (generate-many
  #:len-valid (λ (len params)
                 (let ([k (cdr (assoc 'k params))])
                   (>= len k)))
  #:len-default (λ (params)
                 (let ([k (cdr (assoc 'k params))])
                   (random k (+ k 8))))))
