#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "gets elements after the first number which are not divisible by the first number.")
(define deps '("head" "tail" "remove-mod-k"))

(define examples '((3 1 3 4 7 6 9 2) (4 2 6 10 8 12) (1 2 3)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (filter
                       (λ (x) (not (= (modulo x (car l)) 0)))
                       (cdr l)))

(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref-integer params 'len (random 1 8)
                                  #:validator positive?)]
           [k (random 1 14)])
       (cons
         k
         (if (and (flip) (> k 1))
             (random-list-with-exact-occurrence-where
               (λ (x) (= (modulo x k) 0))
               (λ () (* k (random 10)))
               #:len len)
             (random-list #:len len)))))))
