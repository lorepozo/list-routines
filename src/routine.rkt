#lang racket/base
(provide routine? routine-eval)

(require racket/list)
(require "subroutines.rkt")

;;;;;;;;;;;;;;;;;;
;;;  EXPORTED  ;;;
;;;;;;;;;;;;;;;;;;

;;; a routine is a list with elements of the form (n . l) where n is the name, as
;;; a symbol, of the subroutine and l is a list of arguments with length
;;; params+1, each either ('static . value) or ('dyn . i) where i corresponds to:
;;;   0 for the overall input.
;;;   n for the output of the (n-1)th node.
;;; and static values can only be numbers.
;;; for example:
;;;   '((index-k (dyn . 0) (static . 3)) (add-k (dyn . 0) (dyn . 1)))
;;;   adds the 3rd number of a list to each of its members.
;;;
;;; 
#| EXAMPLE:
(require "routine.rkt")
(define routine '((index-k (dyn . 0) (static . 3))
                  (add-k (dyn . 0) (dyn . 1))))
(define inp '(0 5))
(and (routine? routine inp)
     (routine-eval routine inp))
; Value: #f

(define inp '(1 2 3 4 5))
(and (routine? routine inp)
     (routine-eval routine inp))
; Value: '(4 5 6 7 8)
|#

(define (routine? rs [inp #f])
  (and (known-subroutines? rs)
       (connected? rs)
       (type-static-valid? rs)
       (let ([tps (type-valid? rs)])
         (and tps
              (or (not inp)
                  (value-has-type?
                    inp
                    (vector-ref tps 0)
                    (get-params (cddar rs) #())))))))

; assume (routine? rs) is not #f.
(define (routine-eval rs inp)
  (let ([vs (make-vector (add1 (length rs)) null)])
    (vector-set! vs 0 inp)
    (let lp ([rs rs] [i 1])
      (if (empty? rs)
          (vector-ref vs (sub1 (vector-length vs)))
          (let* ([r (subroutine-ref (caar rs))]
                 [inp (if (eq? (caadar rs) 'static)
                          (cdadar rs)
                          (let* ([i (cdadar rs)])
                            (vector-ref vs i)))]
                 [params (get-params (cddar rs) vs)]
                 [out ((subroutine-evaluate r) inp params)])
            (vector-set! vs i out)
            (lp (cdr rs) (add1 i)))))))


;;;;;;;;;;;;;;;;;;;;
;;;  EVALUATION  ;;;
;;;;;;;;;;;;;;;;;;;;

(define (get-params param-reqs vs)
  (if (empty? param-reqs)
      null
      (let* ([k (if (eq? (caar param-reqs) 'static)
                    (cdar param-reqs)
                    (let ([i (cdar param-reqs)])
                      (vector-ref vs i)))]
             [n (and (> (length param-reqs) 1)
                     (if (eq? (caadr param-reqs) 'static)
                         (cdadr param-reqs)
                         (let ([i (cdadr param-reqs)])
                           (vector-ref vs i))))]
             [ctx (if k `((k . ,k)) null)]
             [ctx (if n (append ctx `(n . ,n)) ctx)])
        ctx)))


;;;;;;;;;;;;;;;;;;;;;;;
;;;  TYPE-CHECKING  ;;;
;;;;;;;;;;;;;;;;;;;;;;;

(define (known-subroutines? rs)
  (andmap (λ (n) (hash-has-key? all-subroutines (car n)))
          rs))

(define (connected? rs)
  (let ([v (make-vector (length rs) #f)])
    (for-each
      (λ (n)
         (for-each
           (λ (x)
              (if (eq? (car x) 'dyn)
                  (vector-set! v (cdr x) #t)
                  null))
           (cdr n)))
      rs)
    (andmap (λ (x) x)
            (vector->list v))))

(define (type-static-valid? rs)
  (andmap
    (λ (n)
       (let ([r (subroutine-ref (car n))])
         (andmap
           (λ (x tp-labels)
              (if (eq? (car x) 'static)
                  (value-has-type? (cdr x) (as-type tp-labels))
                  #t))
           (cdr n)
           (cons (subroutine-input r)
                 (map cdr (subroutine-params r))))))
    rs))

; returns #f if incompatible, else a list of types corresponding to each subroutine's input
(define (type-valid? rs)
  (let ([tps (make-vector (add1 (length rs)) '(any))])
    (let lp ([rs rs] [i 1])
      (if (null? rs)
          (and (andmap
                 (λ (tp) (not (eq? tp '(any))))
                 (vector->list tps))
               tps)
          (let* ([r (subroutine-ref (caar rs))]
                 [context (get-context (cddar rs))])
            (vector-set! tps i (as-type (subroutine-output r)
                                        #:is-output #t
                                        #:input (as-type (subroutine-input r)
                                                         #:context context)
                                        #:context context))
            (for-each
              (λ (x tp-labels)
                 (if (eq? (car x) 'dyn)
                   (let* ([j (cdr x)]
                          [tp (as-type tp-labels #:context context)]
                          [old-tp (vector-ref tps j)]
                          [new-tp (if (equal? old-tp '(any))
                                      tp
                                      (type-intersect-introduce old-tp tp context))])
                     (vector-set! tps j new-tp))
                   null))
              (cdar rs)
              (cons (subroutine-input r)
                    (map cdr (subroutine-params r))))
            (and (not (ormap not (vector->list tps)))
                 (lp (cdr rs) (add1 i))))))))

; the "context" here is an alist of _value_ assignments to function parameters.
; e.g. '((k . 2) (n . 5))
(define (get-context param-reqs)
  (if (empty? param-reqs)
      null
      (let* ([k (and (eq? (caar param-reqs) 'static)
                     (cdar param-reqs))]
             [n (and (> (length param-reqs) 1)
                     (eq? (caadr param-reqs) 'static)
                     (cdadr param-reqs))]
             [ctx (if k `((k . ,k)) null)]
             [ctx (if n (append ctx `(n . ,n)) ctx)])
        ctx)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  TYPE-CONSTRUCTION  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; a type is a list of the form:
;;; - ('list length-at-least-sum each-nonnegative)
;;;   * length-at-least-sum is a list containing integers
;;; - ('number at-least)
;;;   * at-least is an integer or 'inf or 'nonzero
;;; - ('bool)
;;;
;;; the following functions serve to manipulate types given type labels (as
;;; they are used in subroutine definitions).

(define (as-type tp-labels
                 #:is-output [is-output #f]
                 #:input [input '((0) . #f)]
                 #:context [context null])
  (if is-output
    (or (lengthify-output tp-labels input context)
        (number-type tp-labels input context)
        '(bool))
    (or (lengthify-input tp-labels context)
        (number-type tp-labels input context))))

(define (lengthify-input tp-labels context)
  (let ([resolve (λ (x) (or (and (or (eq? x 'k) (eq? x 'n))
                                 (let ([p (assoc x context)]) (and p (cdr p))))
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
(define (lengthify-output tp-labels input context)
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
           (lp (cdr tp-labels) length-at-least-sum (cdr input))]
          [(eq? (car tp-labels) 'same-length)
           (lp (cdr tp-labels) (car input) each-nonnegative)]
          [(eq? (car tp-labels) 'no-smaller)
           (lp (cdr tp-labels) (car input) each-nonnegative)]
          [(eq? (car tp-labels) 'length-add1)
           (lp (cdr tp-labels) (append length-at-least-sum 1) each-nonnegative)]
          [(eq? (car tp-labels) 'length-sub1)
           (lp (cdr tp-labels) (append length-at-least-sum -1) each-nonnegative)]
          [else #f])))
(define (number-type tp-labels input context)
  (let ([resolve (λ (x) (or (and (or (eq? x 'k) (eq? x 'n))
                                 (let ([p (assoc x context)]) (and p (cdr p))))
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
             (lp (cdr tp-labels) (if (cdr input) 0 at-least))]
            [(and (pair? (car tp-labels)) (eq? (caar tp-labels) 'at-least))
             (lp (cdr tp-labels) (resolve (cadar tp-labels)))]
            [else #f]))))


;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  TYPE-INTRINSICS  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

; original constraint was t1, newer constraint is t2.
; so we basically want to ensure all t1 satisfy t2.
(define (type-intersect-introduce t1 t2 context)
  (and (subtype? t1 t2 context) t1))

(define (subtype? t1 t2 context)
  (cond [(not (eq? (car t1) (car t2))) #f]
        [(eq? (car t1) 'list)
         (and (if (caddr t2) (caddr t1) #t)
              (>= (length-cmp (cadr t1) (cadr t2) context) 0)
              )]
        [else #t]))

(define (value-has-type? x tp [context null])
  (cond [(eq? (car tp) 'list)
         (and (list? x)
              (>= (length x) (compute-length-bound (cadr tp) context))
              (or (not (caddr tp))
                  (andmap (λ (n) (>= n 0)) x)))]
        [(eq? (car tp) 'number)
         (and (integer? x)
              (or (eq? (cadr tp) 'inf)
                  (and (eq? (cadr tp) 'nonzero) (not (zero? x)))
                  (>= x (cadr tp))))]
        [else (boolean? x)]))

; each arg should be the length-at-least-sum value of the list type
; returns -1 if l1 < l2
;          0 if l1 == l2
;          1 if l1 > l2
;         #f if indeterminate
(define (length-cmp l1 l2 context)
  (let ([l1-numerical (compute-length-bound l1 context)]
        [l2-numerical (compute-length-bound l2 context)]
        [l1-symbolic (sort (filter symbol? l1) symbol<?)]
        [l2-symbolic (sort (filter symbol? l2) symbol<?)])
    (if (not (eq? l1-symbolic l2-symbolic))
        #f
        (cond [(= l1-numerical l2-numerical) 0]
              [(> l1-numerical l2-numerical) 1]
              [else -1]))))

; context is a alist that could define 'k or 'n.
; If undefined, they are assumed nonnegative.
(define (compute-length-bound nums context)
  (apply + (filter-map (λ (x)
                          (if (symbol? x)
                            (let ([p (assoc x context)])
                              (and p (cdr p)))
                            x))
                       nums)))
