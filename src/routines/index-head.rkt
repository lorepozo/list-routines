#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "indexes with first number into the rest of the list, starting at 1.")
(define deps '("head" "tail" "index-k"))

(define examples '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (3 1 3 4 2) (4 2 6 10 8 12)))

(define (validate l) (and (list? l) (andmap integer? l)
                          (> (length l) 1)
                          (> (car l) 0)
                          (<= (car l) (length (cdr l)))))
(define (evaluate l) (list-ref (cdr l) (sub1 (car l))))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 2 8)
                                   #:validator (λ (n) (> n 1) ))]
            [idx (random 1 len)])
       (cons idx (random-list #:len (sub1 len)))))))
