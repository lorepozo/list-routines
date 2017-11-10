#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "counters occurrences of the number two.")
(define deps '())

(define examples '((1 2 3) (0) (1 1 2 1)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (count (λ (n) (= n 2)) l))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
