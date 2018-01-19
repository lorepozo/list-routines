#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "removes all duplicates, keeping only the first occurrence.")
(define deps '())

(define examples '((1 1 1) (2 5 4 2 2 0 5 1 1)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define evaluate remove-duplicates)

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
