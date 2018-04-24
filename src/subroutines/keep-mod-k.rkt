#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list elements))
(define params '((k . (int nonzero))))

(define description "gets elements which are divisible by `k`.")
(define deps '("is-evens" "is-odds"))

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 5))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (filter (λ (x) (= (modulo x k) 0)) l)))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))])
       (if (and (flip) (> k 1))
           (random-list-with-exact-occurrence-where
             (λ (x) (= (modulo x k) 0))
             (λ () (* k (random 10)))
             #:len len)
           (random-list #:len len))))))
