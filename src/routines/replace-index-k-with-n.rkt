#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "replaces the `k`-th number in the list with `n`.")
(define deps '("index-k"))

(define example-params
  '(#hash((k . 1) (n . 2))
    #hash((k . 2) (n . 10))
    #hash((k . 3) (n . -2))
    #hash((k . 5) (n . 0))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (and (not (null? k)) (positive? k)
         (not (null? n)))))
(define (validate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)]) ; never null b/c validate-params
    (and (list? l) (andmap integer? l)
         (>= (length l) k))))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (list-set l (sub1 k) n)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random k (+ k 8))
                                   #:validator (λ (l) (>= l k)))])
       (random-list #:len len)))
  #:validator validate-params))
