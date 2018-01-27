#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "prelude.rkt")

(define is-parametric #t)
(define description "replaces mulitples of `k` with 1, leaving all others to 0.")
(define deps '())

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))
    #hash((k . 7))))

(define (validate-params params)
  (not (null? (hash-ref-integer params 'k 'null))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]) ; never null b/c validate-params
    (map (λ (x) (if (= (modulo x k) 0) 1 0)) l)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)])
       (if (flip)
           (random-list-with-exact-occurrence k #:len len)
           (random-list #:len len))))
  #:validator validate-params))
