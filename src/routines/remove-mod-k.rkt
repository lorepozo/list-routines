#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "gets elements which are not divisible by `k`.")
(define deps '("evens" "odds"))

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))
    #hash((k . 5))))

(define (validate-params params)
  (not (null? (hash-ref-integer params 'k 'null))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]) ; never null b/c validate-params
    (filter (λ (x) (not (= (modulo x k) 0)))
            l)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)]
            [l (random-list #:len len)])
       (if (flip)
           (let ([idx (random (add1 len))])
             (append (take l idx)
                     (list (* k (random 10)))
                     (drop l idx)))
           l)))
  #:validator validate-params))
