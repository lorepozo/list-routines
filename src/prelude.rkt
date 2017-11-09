#lang racket
(provide hash-ref-number hash-ref-integer nonnegative?)
(provide generate-many random-list)

(require math/distributions)

(define (hash-ref-number h field default
                         #:validator [valid? (λ (n) #t)])
  (let ([value (string->number (hash-ref h field ""))])
    (or (and (valid? value) value)
        default)))

(define (hash-ref-integer h field default
                          #:validator [valid? (λ (n) #t)])
  (hash-ref-number h field default
                   #:validator (λ (n) (and (integer? n) (valid? n)))))

(define (nonnegative? x) (>= x 0))

(define (generate-many generate-one)
  (λ (params)
     (let lp ([count (hash-ref-number params 'count 1)])
       (if (> count 0)
           (cons (generate-one params) (lp (- count 1)))
           null))))

(define (random-list
          #:len [len (inexact->exact
                       (floor (* 3 ((distribution-sample (gamma-dist))))))]
          #:min [min 0]
          #:max [max 17])
  (let lp ([len len])
    (if (> len 0)
        (cons (random min max)
              (lp (- len 1)))
        null)))
