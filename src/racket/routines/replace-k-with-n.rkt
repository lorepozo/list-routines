#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "prelude.rkt")

(define is-parametric #t)
(define description "returns `n` if supplied `k`, otherwise returns the given number.")
(define deps '())

(define example-params
  '(#hash((k . 1) (n . 2))
    #hash((k . 2) (n . 10))
    #hash((k . 3) (n . -2))
    #hash((k . 5) (n . 0))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (and (not (null? k))
         (not (null? n)))))
(define (validate i params) (integer? i))
(define (evaluate i params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (if (= i k) n i)))

(define generate (generate-many
  (λ (params)
     (let ([k (hash-ref-integer params 'k 'null)])
       (if (flip 0.3) k (random 17))))
  #:validator validate-params))
