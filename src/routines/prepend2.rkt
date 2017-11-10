#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "prepends the number two.")
(define deps '())

(define examples '((1 1 1) (0) ()))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (append '(2) l))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 8)
                                  #:validator nonnegative?)])
       (random-list #:len len)))))
