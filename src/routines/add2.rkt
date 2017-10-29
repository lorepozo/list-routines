#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (map (λ (x) (+ x 2)) l))
(define (examples) '((3 2 1) (10)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref params 'len (random 8))])
       (random-list #:len len)))))
