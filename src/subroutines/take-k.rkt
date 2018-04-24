#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least k)))
(define output '(int-list elements))
(define params '((k . (nonnegative))))

(define is-parametric #t)
(define description "gets the first `k` numbers of the list.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 5))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (take l k)))

(define generate (generate-many
  #:len-valid (λ (len params)
                 (let ([k (cdr (assoc 'k params))])
                   (>= len k)))
  #:len-default (λ (params)
                 (let ([k (cdr (assoc 'k params))])
                   (random k (+ k 8))))))
