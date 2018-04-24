#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list (length-at-least 1)))
(define output '(int-list length-sub1 elements))
(define params '())

(define description "gets numbers in the list after the first number.")
(define deps '())

(define example-params null)
(define examples '((5 9 1) (12 4) (2 3 6 7)))

(define (evaluate l params) (cdr l))

(define generate (generate-many
  #:len-valid (λ (len _) (positive? len))
  #:len-default (λ _ (random 1 8))))
