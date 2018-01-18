#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "gets elements which are divisible by `k`.")
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
    (filter (λ (x) (= (modulo x k) 0))
            l)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)])
       (if (and (flip) (> k 1))
           (random-list-with-exact-occurrence-where
             (λ (x) (= (modulo x k) 0))
             (λ () (* k (random 10)))
             #:len len)
           (random-list #:len len))))
  #:validator validate-params))
