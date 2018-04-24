#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list no-smaller))
(define params '((k . (int))))

(define description "inserts `k` between each element of the list.")
(define deps '())

(define example-params
  '(((k . 1))
    ((k . 10))
    ((k . -2))
    ((k . 0))))
(define examples #f)

(define (evaluate l params)
  (if (empty? l)
      '()
      (let ([k (cdr (assoc 'k params))])
        (rest (append-map (λ (e) (list k e)) l)))))

(define generate (generate-many))
