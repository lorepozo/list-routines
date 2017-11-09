#lang racket
(provide description validate evaluate examples generate)

(require "../prelude.rkt")

(define description "gets only even numbers of the list.")

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (filter
                       (λ (x) (= (modulo x 2) 1))
                       l))
(define (examples) '((1 1 3) (2 5 4 2 0 5 1 1)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (random-list #:len len)))))
