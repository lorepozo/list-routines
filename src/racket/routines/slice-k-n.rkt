#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "prelude.rkt")

(define is-parametric #t)
(define description "gets `n` numbers starting with the `k`-th number in the list.")
(define deps '("index-k" "take-k"))

(define example-params
  '(#hash((k . 2) (n . 2))
    #hash((k . 2) (n . 3))
    #hash((k . 3) (n . 3))
    #hash((k . 3) (n . 4))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (and (not (null? k)) (positive? k)
         (not (null? n)) (nonnegative? n))))
(define (validate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)]) ; never null b/c validate-params
    (and (list? l) (andmap integer? l)
         (> (length l) (+ k n)))))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (take (drop l (sub1 k)) n)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [n (hash-ref-integer params 'n 'null)]
            [minlen (add1 (+ k n))]
            [len (hash-ref-integer params 'len (random minlen (+ minlen 8))
                                   #:validator (λ (l) (>= l k)))])
       (random-list #:len len)))
  #:validator validate-params))
