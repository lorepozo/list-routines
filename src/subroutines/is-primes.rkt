#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define primes '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79
                 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163
                 167 173 179 181 191 193 197 199))

(define input '(int-list))
(define output '(bool))
(define params '())

(define description "checks if all numbers of the list are prime (up to 200).")
(define deps '("identify-is-prime"))

(define example-params '(()))

(define (evaluate l params) (not (not (andmap (λ (x) (member x primes)) l))))

(define generate (generate-many
  (λ (_ len)
     (if (flip)
         (take (shuffle primes) len)
         (random-list #:len len)))))
