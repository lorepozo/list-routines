#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "prelude.rkt")

(define is-parametric #f)
(define description "creates a list by repeating the tail of the list as many times as indicated by the first element of the list.")
(define deps '("repeat-k" "head" "tail"))

(define examples '((1 1 2 3) (2 1 2 3) (4 1 2) (5 7 0) (3 3 2 5) (5 1)))

(define (validate l) (and (list? l) (andmap integer? l)
                          (> (length l) 1)
                          (nonnegative? (first l))))
(define (evaluate l) (append-map (λ (_) (rest l)) (range (first l))))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 2 6)
                                   #:validator positive?)]
            [cnt (random 6)])
       (cons cnt (random-list #:len (sub1 len)))))))
