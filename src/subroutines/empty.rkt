#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "determines if the list is empty.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (null? l))

(define generate (generate-many
  (λ (_ len)
     (if (flip 0.2)
       '()
       (random-list #:len len)))))
