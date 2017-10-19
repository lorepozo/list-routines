#lang racket
(provide generate-many random-list)
(require math/distributions)

(define (generate-many generate-one)
  (λ (params)
     (let lp ([count (hash-ref params 'count 1)])
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
