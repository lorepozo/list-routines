#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "gets the first element of the list.")
(define deps '())

(define examples '((1 2 3) (0) (1 1 2 1)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (first l))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 1 8)
                                  #:validator positive?)])
       (random-list #:len len)))))
