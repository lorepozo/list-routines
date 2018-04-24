#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list no-smaller elements))
(define params '((k . (positive))))

(define description "repeats the given list `k` times.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 5))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (append-map (λ _ l) (range k))))

(define generate (generate-many
  #:len-default (λ _ (random 6))))
