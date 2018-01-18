#lang racket
(provide hash-ref-integer nonnegative?)
(provide generate-many)
(provide random-list
         random-list-with-exact-occurrence
         random-list-with-exact-occurrence-where)
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

(define (random-list-with-exact-occurrence
          k
          #:len [len (inexact->exact
                       (floor (* 3 ((distribution-sample (gamma-dist))))))]
          #:cnt [cnt (if (= 0 len) 0 (add1 (random len)))] ; defaults to at least one
          #:min [min 0]
          #:max [max 17])
  (random-list-with-exact-occurrence-where
    (λ (x) (= x k))
    (λ () k)
    #:len len #:cnt cnt #:min min #:max max))

(define (random-list-with-exact-occurrence-where
          where update
          #:len [len (inexact->exact
                       (floor (* 3 ((distribution-sample (gamma-dist))))))]
          #:cnt [cnt (if (= 0 len) 0 (add1 (random len)))] ; defaults to at least one
          #:min [min 0]
          #:max [max 17])
  (if (or (< cnt 0) (> cnt len))
      (raise "invalid count")
      (let lp ([l (random-list #:len len)])
        (let ([current-cnt (count where l)])
          (cond [(= current-cnt cnt) l]
                [(< current-cnt cnt)
                 (lp (list-set l (random len) (update)))]
                [else
                 (lp (list-set l (index-where l where) (random min max)))])))))

(define (flip #:p [p 0.5])
  (< (random) p))
