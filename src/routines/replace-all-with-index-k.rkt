#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "replaces all elements of the list with the `k`-th number of the list.")
(define deps '())

(define example-params
  '(#hash((k . 1))
    #hash((k . 2))
    #hash((k . 3))
    #hash((k . 5))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (not (null? k)) (positive? k))))
(define (validate l params)
  (let ([k (hash-ref-integer params 'k 'null)])
    (and (list? l) (andmap integer? l)
         (>= (length l) k))))
(define (evaluate l params)
  (let* ([k (hash-ref-integer params 'k 'null)]
         [n (list-ref l (sub1 k))])
    (map (λ (_) n) (range (length l)))))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random k (+ k 8))
                                   #:validator (λ (l) (>= l k)))])
       (random-list #:len len)))
  #:validator validate-params))
