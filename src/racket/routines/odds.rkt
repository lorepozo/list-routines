#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "gets only even numbers of the list.")
(define deps '())

(define examples '((1 1 3) (2 5 4 2 0 5 1 1)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (filter
                       (λ (x) (= (modulo x 2) 1))
                       l))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
