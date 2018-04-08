#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length elements))
(define params '((k . (int))))

(define description "shifts number placements forward by `k` (shifts backward if `k` is negative).")
(define deps '())

(define example-params
  '(((k . 1))
    ((k . 3))
    ((k . -2))
    ((k . 10))))

(define (evaluate l params)
  (if (empty? l)
      '()
      (let* ([k (cdr (assoc 'k params))]
             [shift (modulo (* -1 k) (length l))])
        (append (drop l shift) (take l shift)))))

(define generate (generate-many))
