#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "prelude.rkt")

(define is-parametric #t)
(define description "repeats the given list `k` times.")
(define deps '())

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))
    #hash((k . 5))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (not (null? k)) (nonnegative? k))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (append-map (λ _ l) (range k))))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 6)
                                   #:validator nonnegative?)])
       (random-list #:len len)))))
