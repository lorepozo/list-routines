#lang racket
(provide description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define description "indexes with first number into the rest of the list, starting at 1.")
(define deps '("head" "tail"))

(define (validate l) (and (list? l) (andmap integer? l)
                          (> (length l) 1)
                          (> (car l) 0)
                          (<= (car l) (length (cdr l)))))
(define (evaluate l) (list-ref (cdr l) (- (car l) 1)))
(define (examples) '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (3 1 3 4 2) (4 2 6 10 8 12)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 2 8)
                                  #:validator (λ (n) (> n 1) ))])
       (append (list (random 1 len))
               (random-list #:len (- len 1)))))))
