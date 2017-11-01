#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (filter
                       (λ (x) (= (modulo x (car l)) 0))
                       (cdr l)))
(define (examples) '((3 1 3 4 7 6 9 2) (4 2 6 10 8 12) (1 2 3)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 8))])
       (append (list (random 1 8))
               (random-list #:len len))))))
