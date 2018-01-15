#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "shifts number placements forward by `k` (shifts backward if `k` is negative).")
(define deps '())

(define example-params
  '(#hash((k . 1))
    #hash((k . 3))
    #hash((k . -2))
    #hash((k . 10))))

(define (validate-params params)
  (not (null? (hash-ref-integer params 'k 'null))))
(define (validate l params) (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (if (empty? l)
      '()
      (let* ([k (hash-ref-integer params 'k 'null)] ; never null b/c validate-params
             [shift (modulo k (length l))])
        (append (drop l shift) (take l shift)))))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
