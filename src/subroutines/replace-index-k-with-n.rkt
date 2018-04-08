#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least k)))
(define output '(int-list same-length))
(define params '((k . (positive)) (n . (int))))

(define is-parametric #t)
(define description "replaces the `k`-th number in the list with `n`.")
(define deps '("index-k"))

(define example-params
  '(#hash((k . 1) (n . 2))
    #hash((k . 2) (n . 10))
    #hash((k . 3) (n . -2))
    #hash((k . 5) (n . 0))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))]
        [n (cdr (assoc 'n params))])
    (list-set l (sub1 k) n)))

(define generate (generate-many
  #:len-valid (λ (len params)
                 (let ([k (cdr (assoc 'k params))])
                   (>= len k)))
  #:len-default (λ (params)
                 (let ([k (cdr (assoc 'k params))])
                   (random k (+ k 8))))))
