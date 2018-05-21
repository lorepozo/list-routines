#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require math/number-theory)
(require "../prelude.rkt")

(define input '(nonnegative))
(define output '(nonnegative))
(define params '())

(define description "returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.")
(define deps '())

(define example-params null)
(define examples '(2 4 6 9))

(define (evaluate i params) (fibonacci (min i 30)))

(define generate (generate-many
  (λ _ (random 1 16))))
