#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)))
(define evaluate length)
(define (examples) '((1 2 3) (0) (1 1 2 1)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
