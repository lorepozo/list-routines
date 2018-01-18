#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "gets elements after the first number which are divisible by the first number.")
(define deps '("head" "tail" "keep-mod-k"))

(define examples '((3 1 3 4 7 6 9 2) (4 2 6 10 8 12) (1 2 3)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (filter
                       (λ (x) (= (modulo x (car l)) 0))
                       (cdr l)))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 1 8)
                                   #:validator positive?)]
            [l (random-list #:len len)]
            [k (car l)])
       (if (flip)
           (let ([idx (random len)])
             (append (list k)
                     (take (cdr l) idx)
                     (list (* k (random 10)))
                     (drop (cdr l) idx)))
           l)))))
