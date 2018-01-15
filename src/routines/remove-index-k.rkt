#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "removes the `k`-th number in the list (starting at 1).")
(define deps '("index-k"))

(define example-params
  '(#hash((k . 2))
    #hash((k . 3))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (not (null? k)) (positive? k))))
(define (validate l params)
  (let ([k (hash-ref-integer params 'k 'null)]) ; never null b/c validate-params
    (and (list? l) (andmap integer? l)
         (>= (length l) k))))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (append (take l (sub1 k))
            (drop l k))))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random k (+ k 8))
                                   #:validator (λ (l) (>= l k)))])
       (random-list #:len len)))
  #:validator validate-params))
