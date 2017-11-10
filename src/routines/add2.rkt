#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "adds two to each element.")
(define deps '())

(define examples '((3 2 1) (10)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (map (λ (x) (+ x 2)) l))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
