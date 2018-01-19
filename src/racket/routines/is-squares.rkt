#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "checks if all numbers of the list are square.")
(define deps '())

(define examples '((25) (3) (1 4) (1 4 9) (1 4 9 15)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (andmap (λ (x) (integer? (sqrt x))) l))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)]
            [l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x x)) l)
           l)))))
