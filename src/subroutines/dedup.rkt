#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list elements))
(define params '())

(define description "removes adjacent duplicates.")
(define deps '())

(define example-params null)
(define examples '((1 1 1) (2 5 4 2 2 0 5 1 1)))

(define (evaluate l params) 
  (let lp ([l l] [prev null])
    (cond [(null? l) (if (null? prev) prev (list prev))]
          [(null? prev) (lp (cdr l) (car l))]
          [(eq? (car l) prev) (lp (cdr l) prev)]
          [else (cons prev (lp (cdr l) (car l)))])))

(define generate (generate-many))
