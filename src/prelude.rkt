#lang racket/base
(provide generate-many)
(provide random-list
         random-list-with-exact-occurrence
         random-list-with-exact-occurrence-where)
(provide flip)

(require racket/list)

(define (generate-many [generate-one (λ (_ len) (random-list #:len len))]
                       #:len-valid [len-valid (λ (len _) (>= len 0))]
                       #:len-default [len-default (λ _ (random 8))]
                       #:disable-uniqueness [disable-uniqueness #f])
  (λ (params)
     (let* ([lenp (assoc 'len params)]
            [countp (assoc 'count params)]
            [count (or (and countp (positive? (cdr countp)) (cdr countp))
                       1)])
       (let lp ([count count])
         (let ([len (or (and lenp (len-valid (cdr lenp) params) (cdr lenp))
                        (len-default params))])
           (if (> count 0)
             (let* ([rst (lp (sub1 count))])
               (if disable-uniqueness
                 (cons (generate-one params len) (lp (sub1 count)))
                 (let lp2 ()
                   (let ([nxt (generate-one params len)])
                     (if (not (member nxt rst))
                       (cons nxt rst)
                       (lp2))))))
             null))))))

(define (random-list
          #:len len
          #:min [min 0]
          #:max [max 17])
  (let lp ([len len])
    (if (> len 0)
        (cons (random min max)
              (lp (sub1 len)))
        null)))

(define (random-list-with-exact-occurrence
          k
          #:len len
          #:cnt [cnt (if (= 0 len) 0 (add1 (random len)))] ; defaults to at least one
          #:min [min 0]
          #:max [max 17])
  (random-list-with-exact-occurrence-where
    (λ (x) (= x k))
    (λ () k)
    #:len len #:cnt cnt #:min min #:max max))

(define (random-list-with-exact-occurrence-where
          where update
          #:len len
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

(define (flip [p 0.5])
  (< (random) p))
