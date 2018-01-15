#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "expresses each element in the ring of integers modulo `k`.")
(define deps '())

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))
    #hash((k . 10))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (not (null? k)) (positive? k))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]) ; never null b/c validate-params
    (map (λ (x) (modulo x k)) l)))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
