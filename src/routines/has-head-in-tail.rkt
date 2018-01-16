#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define is-parametric #f)
(define description "checks if the first number occurs in the rest of the list.")
(define deps '("head" "tail" "has-k"))

(define examples '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (3 1 3 4 2) (4 2 6 10 8 12)))

(define (validate l) (and (list? l) (andmap integer? l) (not (empty? l))))
(define (evaluate l) (not (false? (member (car l) (cdr l)))))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 1 8)
                                   #:validator positive?)]
            [l (random-list #:len len)]
            [k (car l)])
       (if (flip)
           (let ([idx (random 0 len)])
             (append (list k) (take (cdr l) idx) (list k) (drop (cdr l) idx)))
           l)))))
