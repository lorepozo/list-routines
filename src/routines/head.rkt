#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "gets the first number in the list.")
(define deps '())

(define examples '((5 9 1) (12 4) (2 3 6 7)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define evaluate first)

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 1 8)
                                  #:validator positive?)])
       (random-list #:len len)))))
