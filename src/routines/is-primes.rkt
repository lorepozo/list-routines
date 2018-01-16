#lang racket
(provide is-parametric description deps validate evaluate examples generate)

(require "../prelude.rkt")

(define primes '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79
                 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163
                 167 173 179 181 191 193 197 199))

(define is-parametric #f)
(define description "checks if all numbers of the list are prime (up to 200).")
(define deps '())

(define examples '((2) (2 0) (5 11) (5 11 12)))

(define (validate l) (and (list? l) (andmap integer? l)))
(define (evaluate l) (not (not (andmap (λ (x) (member x primes)) l))))

(define generate (generate-many
  (λ (params)
     (let* ([len (hash-ref-integer params 'len (random 8)
                                   #:validator nonnegative?)])
       (if (flip)
           (take (shuffle primes) len)
           (random-list #:len len))))))
