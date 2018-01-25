#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "creates a list, of size equal to the first element, filled with the second element")
(define deps '("head" "repeat-k"))

(define examples '((1 1) (1 2) (1 3) (2 1) (2 3) (3 7) (6 13)))

(define (validate l) (and (list? l) (andmap integer? l)
                          (= (length l) 2)
                          (nonnegative? (first l))))
(define (evaluate l) (map (λ (_) (second l)) (range (first l))))

(define generate (generate-many
  (λ (params)
     (let* ([cnt (random 8)]
            [val (random 8)])
       (list cnt val)))))
