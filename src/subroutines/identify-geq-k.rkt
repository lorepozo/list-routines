#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length binary))
(define params '((k . (int))))

(define description "replaces numbers greater than or equal to `k` with 1, leaving all others to 0.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 7))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (map (λ (x) (if (>= x k) 1 0)) l)))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))])
       (if (flip)
           (random-list-with-exact-occurrence
             (if (flip) (random k (+ k 4)) (random (- k 4) k))
             #:len len)
           (random-list #:len len))))))
