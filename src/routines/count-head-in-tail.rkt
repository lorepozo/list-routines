#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "counts occurrences of the first number in the rest of the list.")
(define deps '("head" "tail" "count-k"))

(define examples '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (0 5 4 0 2) (3 1 3 3 2) (4 2 6 10 8 12)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (count (λ (n) (= n (car l))) (cdr l)))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 1 8)
                                  #:validator positive?)])
       (random-list #:len len)))))
