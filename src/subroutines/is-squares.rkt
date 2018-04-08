#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "checks if all numbers of the list are square.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (andmap (λ (x) (integer? (sqrt x))) l))

(define generate (generate-many
  (λ (_ len)
     (let ([l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x x)) l)
           l)))))
