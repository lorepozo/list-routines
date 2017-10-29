#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (filter
                       (λ (x) (= (modulo x 2) 0))
                       l))
(define (examples) '((2 0 4) (2 5 4 2 0 5 1 1)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref params 'len (random 8))])
       (random-list #:len len)))))
