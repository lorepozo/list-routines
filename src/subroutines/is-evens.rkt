#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "checks if all numbers of the list are even.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (andmap (λ (x) (= (modulo x 2) 0)) l))

(define generate (generate-many
  (λ (_ len)
     (let ([l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x 2)) l)
           l)))))
