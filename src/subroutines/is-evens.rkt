#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "checks if all numbers of the list are even.")
(define deps '())

(define example-params null)
(define examples '((2 0 4) (2 5 4 2 0 5 1 1)))

(define (evaluate l params) (andmap (λ (x) (= (modulo x 2) 0)) l))

(define generate (generate-many
  (λ (_ len)
     (let ([l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x 2)) l)
           l)))))
