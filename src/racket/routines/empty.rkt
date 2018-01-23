#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "determines if the list is empty.")
(define deps '("len"))

(define examples '((1 2 3) () (0) (1 1 2 1) ()))

(define (validate l) (and (list? l) (andmap integer? l)))
(define evaluate empty?)

(define generate (generate-many
  (λ (params)
     (if (flip)
         '()
         (let ([len (hash-ref-integer params 'len (random 8)
                                      #:validator nonnegative?)])
           (random-list #:len len))))))
