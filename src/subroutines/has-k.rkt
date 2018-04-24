#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(bool))
(define params '((k . (int))))

(define description "checks if the number `k` occurs in the list.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 10))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (not (not (member k l)))))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))])
       (if (flip)
           (random-list-with-exact-occurrence k #:len len)
           (random-list #:len len))))))
