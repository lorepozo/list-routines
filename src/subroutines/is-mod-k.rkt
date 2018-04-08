#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '((k . (non-zero))))

(define description "checks if all numbers of the list are divisible by `k`.")
(define deps '("evens" "odds" "identify-is-mod-k"))

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 5))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (andmap (λ (x) (= (modulo x k) 0)) l)))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))]
           [l (random-list #:len len)])
       (if (flip)
           (map (λ (x) (* x k)) l)
           l)))))
