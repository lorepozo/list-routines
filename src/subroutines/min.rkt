#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list (length-at-least 1)))
(define output '(int element))
(define params '())

(define description "gets the smallest element of the list.")
(define deps '())

(define example-params null)
(define examples '((1 2 3) (0) (1 1 2 1)))

(define (evaluate l params) (apply min l))

(define generate (generate-many
  #:len-valid (λ (len _) (positive? len))
  #:len-default (λ _ (random 1 8))))
