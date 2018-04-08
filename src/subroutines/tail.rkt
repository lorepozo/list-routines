#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least 1)))
(define output '(int-list length-sub1 elements))
(define params '())

(define description "gets numbers in the list after the first number.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) rest)

(define generate (generate-many
  #:len-valid (λ (len _) (positive? len))
  #:len-default (λ _ (random 1 8))))
