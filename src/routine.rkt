#lang racket/base
(provide routine?
         routine-eval
         routine-generate-input)
(provide generate-routines)

(require racket/list racket/vector)
(require "subroutines.rkt")

;;;;;;;;;;;;;;;;;
;;;  ROUTINE  ;;;
;;;;;;;;;;;;;;;;;

;;; a routine is a topologically-sorted list with elements of the form (n . l)
;;; where n is the name, as a symbol, of the subroutine and l is a list of
;;; arguments with length params+1, each either ('static . value) or ('dyn . i)
;;; where i corresponds to:
;;;   0 for the overall input.
;;;   n for the output of the (n-1)th node.
;;; and static values can only be numbers.
;;; for example:
;;;   '((index-k (dyn . 0) (static . 3)) (add-k (dyn . 0) (dyn . 1)))
;;;   adds the 3rd number of a list to each of its members.

#| EXAMPLE:
(require "routine.rkt")
(define routine '((index-k (dyn . 0) (static . 3))
                  (add-k (dyn . 0) (dyn . 1))))
(define inp '(1 2 3 4 5))
(and (routine? routine inp)
     (routine-eval routine inp))
; Value: '(4 5 6 7 8)

(define inp '(0 5))
(and (routine? routine inp)
     (routine-eval routine inp))
; Value: #f
|#

(define (routine? rs [inp #f])
  (and (known-subroutines? rs)
       (connected? rs)
       (type-static-valid? rs)
       (let ([tps (type-valid? rs)])
         (if (not inp)
             tps
             (and tps
                  (value-has-type?
                    inp
                    (vector-ref tps 0)
                    (get-params-dyn (cddar rs) #())))))))

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
                 [params (get-params-dyn (cddar rs) vs)]
                 [out ((subroutine-evaluate r) inp params)])
            (vector-set! vs i out)
            (lp (cdr rs) (add1 i)))))))

; returns list (input output) or #f
(define (routine-generate-input rs [gen-params '((count . 1))])
  (let ([tps (routine? rs)])
    (if (not tps)
        #f
        (let* ([n (findf (λ (n) (equal? (cadr n) '(dyn . 0))) rs)] ; n cannot be #f
               [r (subroutine-ref (car n))]
               [params (get-params-static (cddr n))]
               [params (append gen-params params)])
          (let lp ([retries 5])
            (if (zero? retries)
                #f
                (let ([inps ((subroutine-generate-input r) params)])
                  (if (andmap (λ (inp)
                                 (value-has-type? inp (vector-ref tps 0) params))
                              inps)
                      (map (λ (inp) (list inp (routine-eval rs inp))) inps)
                      (begin
                        (displayln
                          `(bad-generation
                             (routine ,(car n))
                             (inps ,inps)
                             (tp ,(vector-ref tps 0))
                             (params ,params))
                          (current-error-port))
                        (lp (sub1 retries)))))))))))


;;;;;;;;;;;;;;;;;;;;
;;;  GENERATION  ;;;
;;;;;;;;;;;;;;;;;;;;

(define (generate-routines bound [rand-limit 8])
  (if (< bound (hash-count all-subroutines))
      (generate-routines-first-round rand-limit bound)
      (let lp ([size 1] [generated (generate-routines-first-round rand-limit)])
        ; generated is list of pairs (rs . tps)
        (if (> size 7)
            (begin
              (displayln "requested too many routines" (current-error-port))
              (map car generated))
            (if (>= (length generated) bound)
                (map car (take generated bound))
                (lp (add1 size)
                    (append generated
                            (generate-routines-deepen generated rand-limit))))))))

; generated is list of pairs (rs . tps)
(define (generate-routines-deepen generated rand-limit)
  (append-map
    (λ (x)
       (let ([rs (car x)] [tps (cdr x)])
         (append-map
           (λ (name)
              (let* ([r (subroutine-ref name)]
                     [arg-tp-labels (cons (subroutine-input r)
                                          (map cdr (subroutine-params r)))]
                     [arg-tps (map as-type arg-tp-labels)]
                     [latest-output (vector-ref tps (sub1 (vector-length tps)))]
                     [compatible-args
                      (filter-map (λ (tp i) (and (subtype? tp latest-output) i))
                                  arg-tps (range (length arg-tps)))])
                (filter-map
                  (λ (i)
                     (let* ([args
                             (map (λ (tp j)
                                     (if (= i j)
                                         `(dyn . ,(vector-length tps))
                                         (if (eq? (car tp) 'list)
                                             (ormap
                                               (λ (x) (let ([rtp (car x)] [k (cdr x)])
                                                  (and (subtype? rtp tp)
                                                       `(dyn . ,k))))
                                               (shuffle
                                                 (map (λ (rtp k) (cons rtp k))
                                                      (vector->list tps)
                                                      (range (vector-length tps)))))
                                             (or (and (flip 0.2)
                                                      ; try to connect to some routine output
                                                      (ormap
                                                        (λ (x) (let ([rtp (car x)] [k (cdr x)])
                                                           (and (subtype? rtp tp)
                                                                `(dyn . ,k))))
                                                        (shuffle
                                                          (map (λ (rtp k) (cons rtp k))
                                                               (vector->list tps)
                                                               (range (vector-length tps))))))
                                                 `(static ,(gen-param tp rand-limit))))))
                                  arg-tps (range (length arg-tps)))])
                       (and (not (ormap not args))
                            (cons (append rs (list (cons name args)))
                                  (vector-append
                                    tps
                                    (vector (as-type (subroutine-output r)
                                                     #:is-output #t
                                                     #:input (car arg-tps)
                                                     #:params (get-params-static (cdr args)))))))))
                  compatible-args)))
           (hash-keys all-subroutines))))
    generated))

(define (generate-routines-first-round rand-limit [bound #f])
  (map (λ (name)
          (let* ([r (subroutine-ref name)]
                 [node (append (list name '(dyn . 0))
                               (map (λ (pair) (cons 'static (cdr pair)))
                                    ((subroutine-generate-params r) rand-limit)))]
                 [params (get-params-static (cddr node))])
            (cons (list node)
                  (vector (as-type (subroutine-output r)
                                   #:is-output #t
                                   #:input (as-type (subroutine-input r)
                                                    #:params params)
                                   #:params params)))))
       (if bound
           (take (hash-keys all-subroutines) bound)
           (hash-keys all-subroutines))))


(define (gen-param tp rand-limit)
  (cond [(not (eq? (car tp) 'number)) (raise `("invalid param type" ,tp))]
        [(eq? (cadr tp) '-inf)
         (random (- rand-limit) rand-limit)]
        [(eq? (cadr tp) 'nonzero)
         (let lp ()
           (let ([r (random (- rand-limit) rand-limit)])
             (if (zero? r)
                 (lp)
                 r)))]
        [else (random (cadr tp) (+ (cadr tp) rand-limit))]))


;;;;;;;;;;;;;;;;;;;;
;;;  EVALUATION  ;;;
;;;;;;;;;;;;;;;;;;;;

(define (get-params-dyn param-reqs vs)
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
             [ctx (if n (append ctx `((n . ,n))) ctx)])
        ctx)))


(define (get-params-static param-reqs)
  (if (empty? param-reqs)
      null
      (let* ([k (and (eq? (caar param-reqs) 'static)
                     (cdar param-reqs))]
             [n (and (> (length param-reqs) 1)
                     (eq? (caadr param-reqs) 'static)
                     (cdadr param-reqs))]
             [ctx (if k `((k . ,k)) null)]
             [ctx (if n (append ctx `((n . ,n))) ctx)])
        ctx)))


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  ROUTINE-CHECKING  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

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
                 [params (get-params-static (cddar rs))])
            (vector-set! tps i (as-type (subroutine-output r)
                                        #:is-output #t
                                        #:input (as-type (subroutine-input r)
                                                         #:params params)
                                        #:params params))
            (for-each
              (λ (x tp-labels)
                 (if (eq? (car x) 'dyn)
                   (let* ([j (cdr x)]
                          [tp (as-type tp-labels #:params params)]
                          [old-tp (vector-ref tps j)]
                          [new-tp (if (equal? old-tp '(any))
                                      tp
                                      (type-intersect-introduce old-tp tp params))])
                     (vector-set! tps j new-tp))
                   null))
              (cdar rs)
              (cons (subroutine-input r)
                    (map cdr (subroutine-params r))))
            (and (not (ormap not (vector->list tps)))
                 (lp (cdr rs) (add1 i))))))))


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


;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  TYPE-INTRINSICS  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

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
        [else #t]))

(define (value-has-type? x tp [params null])
  (cond [(eq? (car tp) 'list)
         (and (list? x)
              (>= (length x) (compute-length-bound (cadr tp) params))
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


;;;;;;;;;;;;;;
;;;  UTIL  ;;;
;;;;;;;;;;;;;;

(define (flip [p 0.5])
  (< (random) p))
