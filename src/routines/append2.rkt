#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "appends the number two.")
(define deps '())

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (append l '(2)))
(define (examples) '((1 1 1) (0) ()))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
