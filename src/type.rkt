#lang racket/base
(provide as-type subtype? value-has-type?)
(provide type-intersect-introduce)
(provide gen-param-number)

(require racket/list)

;;;;;;;;;;;;;;
;;;  TYPE  ;;;
;;;;;;;;;;;;;;

;;; a type is a list of the form:
;;; - ('list length-at-least-sum each-nonnegative)
;;;   * length-at-least-sum is a list containing integers
;;; - ('number at-least)
;;;   * at-least is an integer or '-inf or 'nonzero
;;; - ('bool)
;;;
;;; the following functions serve to manipulate types given type labels (as
;;; they are used in subroutine definitions).

(define (as-type tp-labels
                 #:is-output [is-output #f]
                 #:input [input-tp '((0) . #f)]
                 #:params [params null])
  (if is-output
    (or (lengthify-output tp-labels input-tp params)
        (number-type tp-labels input-tp params)
        '(bool))
    (or (lengthify-input tp-labels params)
        (number-type tp-labels input-tp params))))

(define (lengthify-input tp-labels params)
  (let ([resolve (λ (x) (or (and (or (eq? x 'k) (eq? x 'n))
                                 (let ([p (assoc x params)]) (and p (cdr p))))
                            x))])
    (let lp ([tp-labels tp-labels] [length-at-least-sum '(0)] [each-nonnegative #f])
      (cond [(empty? tp-labels)
             `(list ,length-at-least-sum ,each-nonnegative)]
            [(eq? (car tp-labels) 'int-list)
             (lp (cdr tp-labels) length-at-least-sum each-nonnegative)]
            [(eq? (car tp-labels) 'each-nonnegative)
             (lp (cdr tp-labels) length-at-least-sum #t)]
            [(and (pair? (car tp-labels)) (eq? (caar tp-labels) 'length-at-least))
             (lp (cdr tp-labels) (list (resolve (cadar tp-labels))) each-nonnegative)]
            [(and (pair? (car tp-labels)) (eq? (caar tp-labels) 'length-at-least-sum))
             (lp (cdr tp-labels) (map resolve (cadar tp-labels)) each-nonnegative)]
            [else #f]))))
(define (lengthify-output tp-labels input-tp params)
  (let lp ([tp-labels tp-labels] [length-at-least-sum '(0)] [each-nonnegative #f])
    (cond [(empty? tp-labels)
           `(list ,length-at-least-sum ,each-nonnegative)]
          [(eq? (car tp-labels) 'int-list)
           (lp (cdr tp-labels) length-at-least-sum each-nonnegative)]
          [(eq? (car tp-labels) 'each-nonnegative)
           (lp (cdr tp-labels) length-at-least-sum #t)]
          [(eq? (car tp-labels) 'binary)
           (lp (cdr tp-labels) length-at-least-sum #t)]
          [(eq? (car tp-labels) 'elements)
           (lp (cdr tp-labels) length-at-least-sum (or each-nonnegative (caddr input-tp)))]
          [(eq? (car tp-labels) 'same-length)
           (lp (cdr tp-labels) (cadr input-tp) each-nonnegative)]
          [(eq? (car tp-labels) 'no-smaller)
           (lp (cdr tp-labels) (cadr input-tp) each-nonnegative)]
          [(eq? (car tp-labels) 'length-add1)
           (lp (cdr tp-labels) (cons 1 length-at-least-sum) each-nonnegative)]
          [(eq? (car tp-labels) 'length-sub1)
           (lp (cdr tp-labels) (cons -1 length-at-least-sum) each-nonnegative)]
          [else #f])))
(define (number-type tp-labels input-tp params)
  (let ([resolve (λ (x) (or (and (or (eq? x 'k) (eq? x 'n))
                                 (let ([p (assoc x params)]) (and p (cdr p))))
                            x))])
    (let lp ([tp-labels tp-labels] [at-least '-inf])
      (cond [(empty? tp-labels)
             `(number ,at-least)]
            [(eq? (car tp-labels) 'int)
             (lp (cdr tp-labels) at-least)]
            [(eq? (car tp-labels) 'nonzero)
             (lp (cdr tp-labels) 'nonzero)]
            [(eq? (car tp-labels) 'nonnegative)
             (lp (cdr tp-labels) 0)]
            [(eq? (car tp-labels) 'positive)
             (lp (cdr tp-labels) 1)]
            [(eq? (car tp-labels) 'element)
             (lp (cdr tp-labels) (if (caddr input-tp) 0 at-least))]
            [(and (pair? (car tp-labels)) (eq? (caar tp-labels) 'at-least))
             (lp (cdr tp-labels) (resolve (cadar tp-labels)))]
            [else #f]))))

; original constraint was t1, newer constraint is t2.
; so we basically want to ensure all t1 satisfy t2.
(define (type-intersect-introduce t1 t2 params)
  (and (subtype? t1 t2 params) t1))

(define (subtype? t1 t2 [params null])
  (cond [(not (eq? (car t1) (car t2))) #f]
        [(eq? (car t1) 'list)
         (and (if (caddr t2) (caddr t1) #t)
              (let ([cmp (length-cmp (cadr t1) (cadr t2) params)])
                (and cmp (>= cmp 0))))]
        [else (let ([b1 (cadr t1)] [b2 (cadr t2)])
                (cond [(eq? b1 b2) #t]
                      [(eq? b1 'nonzero) #f]
                      [(eq? b2 'nonzero) (and (not (eq? b1 '-inf))
                                              (positive? b1))]
                      [(eq? b2 '-inf) #t]
                      [(eq? b1 '-inf) #f]
                      [else (>= b1 b2)]))]))

(define (value-has-type? x tp [params null])
  (cond [(eq? (car tp) 'list)
         (cond [(not (list? x)) #f]
               [(< (length x) (compute-length-bound (cadr tp) params)) #f]
               [(not (caddr tp)) #t]
               [else (andmap (λ (n) (>= n 0)) x)])]
        [(eq? (car tp) 'number)
         (cond [(not (integer? x)) #f]
               [(eq? (cadr tp) '-inf) #t]
               [(eq? (cadr tp) 'nonzero)
                (not (zero? x))]
               [else (>= x (cadr tp))])]
        [else (boolean? x)]))

; each arg should be the length-at-least-sum value of the list type
; returns -1 if l1 < l2
;          0 if l1 == l2
;          1 if l1 > l2
;         #f if indeterminate
(define (length-cmp l1 l2 params)
  (let ([l1-numerical (compute-length-bound l1 params)]
        [l2-numerical (compute-length-bound l2 params)]
        [l1-symbolic (sort (filter symbol? l1) symbol<?)]
        [l2-symbolic (sort (filter symbol? l2) symbol<?)])
    (if (not (eq? l1-symbolic l2-symbolic))
        #f
        (cond [(= l1-numerical l2-numerical) 0]
              [(> l1-numerical l2-numerical) 1]
              [else -1]))))

; nums corresponds to (cadr tp) where (eq? (car tp) 'list).
; params is a alist that could define 'k or 'n.
; If undefined, they are assumed nonnegative.
(define (compute-length-bound nums params)
  (apply + (filter-map (λ (x)
                          (if (symbol? x)
                            (let ([p (assoc x params)])
                              (and p (cdr p)))
                            x))
                       nums)))

(define (gen-param-number tp rand-limit)
  (cond [(not (eq? (car tp) 'number)) (raise `("invalid param type" ,tp))]
        [(eq? (cadr tp) '-inf)
         (random (- rand-limit) rand-limit)]
        [(eq? (cadr tp) 'nonzero)
         (if (< (random) 0.5)
           (random (- rand-limit) 0)
           (random 1 rand-limit))]
        [else (random (cadr tp) (+ (cadr tp) rand-limit))]))

