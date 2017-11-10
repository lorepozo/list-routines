#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "gets numbers in the list after the first number.")
(define deps '())

(define examples '((5 9 1) (12 4) (2 3 6 7)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define evaluate rest)

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 1 8)
                                  #:validator positive?)])
       (random-list #:len len)))))
