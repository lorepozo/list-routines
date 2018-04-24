#lang racket/base
(provide params input output description deps example-params examples evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list))
(define output '(nonnegative))
(define params '((k . (int))))

(define description "counts occurrences of the number `k`.")
(define deps '())

(define example-params
  '(((k . 2))
    ((k . 3))
    ((k . 10))))
(define examples #f)

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))])
    (count (λ (n) (= n k)) l)))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))])
       (if (flip)
         (random-list-with-exact-occurrence k #:len len)
         (random-list #:len len))))))
