#lang racket
(provide hash-ref-integer nonnegative?)
(provide generate-many random-list)
(provide flip)

(require math/distributions)

(define (hash-ref-integer h field default
                          #:validator [valid? (λ (n) #t)])
  (let ([value (hash-ref h field 'null)])
    (or (and (integer? value) (valid? value) value)
        default)))

(define (nonnegative? x) (>= x 0))

(define (generate-many generate-one
                       #:validator [valid? (λ (p) #t)])
  (λ (params)
     (if (not (valid? params))
         'null
         (let lp ([count (hash-ref-integer params 'count 1)])
           (if (> count 0)
               (cons (generate-one params) (lp (- count 1)))
               null)))))

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

(define (flip)
  (> (random) 0.5))
