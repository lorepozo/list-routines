#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "checks if all numbers of the list are square.")
(define deps '())

(define example-params null)
(define examples '((25) (3) (1 4) (1 4 9) (1 4 9 15)))

(define (evaluate l params) (andmap (λ (x) (integer? (sqrt x))) l))

(define generate (generate-many
  (λ (_ len)
     (let ([l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x x)) l)
           l)))))
