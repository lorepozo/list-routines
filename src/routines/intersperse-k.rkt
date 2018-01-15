#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "inserts `k` between each element of the list.")
(define deps '())

(define example-params
  '(#hash((k . 1))
    #hash((k . 10))
    #hash((k . -2))
    #hash((k . 0))))

(define (validate-params params)
  (not (null? (hash-ref-integer params 'k 'null))))
(define (validate l params)
  (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (if (empty? l)
      '()
      (let ([k (hash-ref-integer params 'k 'null)])
        (rest (append-map (λ (e) (list k e)) l)))))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
