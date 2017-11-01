#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (append '(2) l))
(define (examples) '((1 1 1) (0) ()))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
