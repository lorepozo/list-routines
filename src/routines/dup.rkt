#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (append-map (λ (e) (list e e)) l))
(define (examples) '((0) (7 2 4)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
