#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (not (false? (member (car l) (cdr l)))))
(define (examples) '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (3 1 3 4 2) (4 2 6 10 8 12)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-number params 'len (random 1 8))])
       (random-list #:len len)))))
