#lang racket
(provide description validate evaluate examples generate)

(require "../prelude.rkt")

(define description "removes all duplicates, keeping only the first occurrence.")

(define (validate l) (and (list? l) (andmap integer? l)))
(define evaluate remove-duplicates)
(define (examples) '((1 1 1) (2 5 4 2 0 5 1 1)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
