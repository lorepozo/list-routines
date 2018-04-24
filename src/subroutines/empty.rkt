#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "determines if the list is empty.")
(define deps '())

(define example-params null)
(define examples '((1 2 3) () (0) (1 1 2 1) ()))

(define (evaluate l params) (null? l))

(define generate (generate-many
  (λ (_ len)
     (if (flip 0.2)
       '()
       (random-list #:len len)))))
