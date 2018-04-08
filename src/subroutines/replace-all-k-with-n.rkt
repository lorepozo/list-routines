#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")

(define input '(int-list))
(define output '(int-list same-length))
(define params '((k . (int)) (n . (int))))

(define description "replaces all occurences of `k` in the list with `n`.")
(define deps '())

(define example-params
  '(((k . 1) (n . 2))
    ((k . 2) (n . 10))
    ((k . 3) (n . -2))
    ((k . 5) (n . 0))))

(define (evaluate l params)
  (let ([k (cdr (assoc 'k params))]
        [n (cdr (assoc 'n params))])
    (map (λ (x) (if (= x k) n x)) l)))

(define generate (generate-many
  (λ (params len)
     (let ([k (cdr (assoc 'k params))])
       (if (flip)
           (random-list-with-exact-occurrence k #:len len)
           (random-list #:len len))))))
