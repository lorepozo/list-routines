#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least-sum (k n 1))))
(define output '(int-list elements))
(define params '((k . (positive)) (n . (nonnegative))))

(define description "gets `n` numbers starting with the `k`-th number in the list.")
(define deps '("index-k" "take-k"))

(define example-params
  '(((k . 2) (n . 2))
    ((k . 2) (n . 3))
    ((k . 3) (n . 3))
    ((k . 3) (n . 4))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))]
        [n (cdr (assoc 'n params))])
    (take (drop l (sub1 k)) n)))

(define generate (generate-many
  #:len-valid (λ (len params)
                 (let* ([k (cdr (assoc 'k params))]
                        [n (cdr (assoc 'n params))]
                        [minlen (add1 (+ k n))])
                   (>= len minlen)))
  #:len-default (λ (params)
                 (let* ([k (cdr (assoc 'k params))]
                        [n (cdr (assoc 'n params))]
                        [minlen (add1 (+ k n))])
                   (random minlen (+ minlen 8))))))
