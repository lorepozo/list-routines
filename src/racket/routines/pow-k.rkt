#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "prelude.rkt")

(define is-parametric #t)
(define description "exponentiates each element by `k` (e.g. squaring, cubing).")
(define deps '("mult-k"))

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))
    #hash((k . 4))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (not (null? k)) (positive? k))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]) ; never null b/c validate-params
    (map (λ (x) (expt x k)) l)))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))