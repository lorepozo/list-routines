#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "performs a Caesar cipher with shift value of `k` (i.e. adds `k` to each element) in the ring of integers modulo `n`.")
(define deps '("modulo-k" "add-k"))

(define example-params
  '(#hash((k . 2) (n . 7))
    #hash((k . 1) (n . 10))
    #hash((k . 10) (n . 26))
    #hash((k . 13) (n . 26))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (and (not (null? k))
         (not (null? n)) (positive? n))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)]) ; never null b/c validate-params
    (map (λ (x) (modulo (+ x k) n)) l)))

(define generate (generate-many
  (λ (params)
     (let* ([n (hash-ref-integer params 'n 'null)]
            [len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)])
       (random-list #:len len #:max n)))
  #:validator validate-params))
