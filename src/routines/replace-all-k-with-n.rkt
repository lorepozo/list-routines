#lang racket
(provide is-parametric description deps validate-params validate evaluate example-params generate)

(require "../prelude.rkt")

(define is-parametric #t)
(define description "replaces all occurences of `k` in the list with `n`.")
(define deps '())

(define example-params
  '(#hash((k . 1) (n . 2))
    #hash((k . 2) (n . 10))
    #hash((k . 3) (n . -2))
    #hash((k . 5) (n . 0))))

(define (validate-params params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (and (not (null? k))
         (not (null? n)))))
(define (validate l params)
  (and (list? l) (andmap integer? l)))
(define (evaluate l params)
  (let ([k (hash-ref-integer params 'k 'null)]
        [n (hash-ref-integer params 'n 'null)])
    (map (λ (x) (if (= x k) n x)) l)))

(define generate (generate-many
  (λ (params)
     (let* ([k (hash-ref-integer params 'k 'null)]
            [len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)]
            [l (random-list #:len len)])
       (if (flip)
           (random-list-with-exact-occurrence k #:len len)
           (random-list #:len len))))
  #:validator validate-params))
