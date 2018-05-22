#lang racket/base
(provide routine?
         routine-eval
         routine-generate-input
         routine-regenerate-static-params)
(provide generate-routines)

(require racket/list racket/vector)
(require "type.rkt")
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
(define (routine-generate-input rs [g-params '((count . 1))])
  (let ([tps (routine? rs)])
    (if (not tps)
        #f
        (let* ([n (findf (λ (n) (equal? (cadr n) '(dyn . 0))) rs)] ; n cannot be #f
               [r (subroutine-ref (car n))]
               [params (get-params-static (cddr n))]
               [params (append g-params params)])
          (let lp ([retries 5])
            (if (negative? retries)
                #f
                (let ([inps ((subroutine-generate-input r) params)])
                  (if (andmap (λ (inp)
                                 (value-has-type? inp (vector-ref tps 0) params))
                              inps)
                      (let ([outs (map (λ (inp) (routine-eval rs inp)) inps)])
                        (if (andmap (λ (inp out)
                                       (and (cond [(list? inp) (andmap (λ (x) (< (abs x) 250)) inp)]
                                                  [else (< inp 30)])
                                            (cond [(list? out) (andmap (λ (y) (< (abs y) 250)) out)]
                                                  [(integer? out) (< (abs out) 1000)]
                                                  [else #t])))
                                    inps outs)
                          (map list inps outs)
                          (lp (sub1 retries))))
                      (begin
                        (displayln
                          `(bad-generation
                             (routine ,(car n))
                             (inps ,inps)
                             (tp ,(vector-ref tps 0))
                             (params ,params))
                          (current-error-port))
                        (lp (sub1 retries)))))))))))

(define (routine-regenerate-static-params rs [rand-limit 8])
  (let ([tps (type-valid? rs)])
    (regenerate-static-values rs tps rand-limit)))


;;;;;;;;;;;;;;;;;;;;
;;;  GENERATION  ;;;
;;;;;;;;;;;;;;;;;;;;

(define (take-uniq lst k [same? equal?] #:uniq [uniq #f])
  (if uniq
    (reverse
      (let lp ([acc null] [lst lst])
        (if (or (empty? lst) (= (length acc) k))
          acc
          (let* ([v (car lst)]
                 [acc (if (andmap (λ (z) (not (same? v z))) acc)
                        (cons v acc)
                        acc)])
            (lp acc (cdr lst))))))
    (if (> (length lst) k) (take lst k) lst)))

(define (generate-routines bound [rand-limit 8] [uniq #f] [do-shuffle #t])
  (let lp ([size 1] [generated (take-uniq
                                 (let ([fst (generate-routines-first-round rand-limit)])
                                   (if do-shuffle (shuffle fst) fst))
                                 bound
                                 same-routine-behavior?)])
    ; generated is list of pairs (rs . tps)
    (if (> size 7)
        (begin
          (displayln "requested too many routines" (current-error-port))
          (map car generated))
        (if (>= (length generated) bound)
            (filter-map
              (λ (x)
                 (if (not (routine? (car x)))
                   (begin
                     (display "discrepancy " (current-error-port))
                     (displayln x (current-error-port))
                     #f)
                   (car x)))
              (take (if do-shuffle (shuffle generated) generated) bound))
            (lp (add1 size)
                (take-uniq
                  (append generated
                          (generate-routines-deepen
                            generated
                            rand-limit))
                  bound
                  same-routine-behavior?
                  #:uniq uniq))))))

; generated is list of pairs (rs . tps)
(define (generate-routines-deepen generated rand-limit)
  (append-map ; each previously generated
    (λ (x)
       (let* ([rs (car x)]
              [tps (cdr x)])
         (append-map ; each subroutine
           (λ (name)
              (let* ([rs (regenerate-static-values rs tps rand-limit)]
                     [r (subroutine-ref name)]
                     [arg-tp-labels (cons (subroutine-input r)
                                          (map cdr (subroutine-params r)))]
                     [arg-tps (map as-type arg-tp-labels)]
                     [latest-output (vector-ref tps (sub1 (vector-length tps)))]
                     [compatible-args
                      (filter-map (λ (tp i) (and (subtype? latest-output tp) i))
                                  arg-tps (range (length arg-tps)))])
                (filter-map
                  (λ (i)
                     (let* ([args
                             (map (λ (tp j)
                                     (if (= i j)
                                         `(dyn . ,(sub1 (vector-length tps)))
                                         (if (eq? (car tp) 'list)
                                             (ormap
                                               (λ (x) (let ([rtp (car x)] [k (cdr x)])
                                                  (and (subtype? rtp tp)
                                                       `(dyn . ,k))))
                                               (shuffle
                                                 (map (λ (rtp k) (cons rtp k))
                                                      (vector->list tps)
                                                      (range (vector-length tps)))))
                                             (or (and (flip 0.3)
                                                      ; try to connect to some routine output
                                                      (ormap
                                                        (λ (x) (let ([rtp (car x)] [k (cdr x)])
                                                           (and (subtype? rtp tp)
                                                                `(dyn . ,k))))
                                                        (shuffle
                                                          (map (λ (rtp k) (cons rtp k))
                                                               (vector->list tps)
                                                               (range (vector-length tps))))))
                                                 `(static . ,((subroutine-generate-param r)
                                                              (car (list-ref (subroutine-params r)
                                                                             (sub1 j)))
                                                              rand-limit))))))
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

(define (generate-routines-first-round rand-limit)
  (append-map
    (λ (name)
       (let ([r (subroutine-ref name)])
         (cond [(empty? (subroutine-params r))
                (let* ([node (list name '(dyn . 0))]
                       [inp-tp (as-type (subroutine-input r))]
                       [out-tp (as-type (subroutine-output r)
                                        #:is-output #t
                                        #:input inp-tp)])
                  (list (cons (list node)
                              (vector inp-tp out-tp))))
                ]
               [else
                 (map (λ (params)
                         (let* ([node (append (list name '(dyn . 0))
                                              (map (λ (pair) (cons 'static (cdr pair)))
                                                   params))]
                                [inp-tp (as-type (subroutine-input r) #:params params)]
                                [out-tp (as-type (subroutine-output r)
                                                 #:is-output #t
                                                 #:input inp-tp
                                                 #:params params)])
                           (cons (list node)
                                 (vector inp-tp out-tp))))
                      (append (subroutine-example-params r)
                              (list ((subroutine-generate-params r) rand-limit #:weight 0))))
                 ])))
    (hash-keys all-subroutines)))


(define (same-routine-behavior? a b)
  (and (equal? (vector-ref (cdr a) 0) (vector-ref (cdr b) 0))
       (let ([exs-a (routine-generate-input (car a) '((count . 4)))]
             [exs-b (routine-generate-input (car b) '((count . 4)))])
         (and exs-a exs-b
           (andmap (λ (ex) (eq? (cdr ex) (routine-eval (car b) (car ex)))) exs-a)
           (andmap (λ (ex) (eq? (cdr ex) (routine-eval (car a) (car ex)))) exs-b)))))


(define (regenerate-static-values rs tps rand-limit)
  (let lp ([depth 5])
    (if (negative? depth)
      rs
      (let ([new-rs (map (λ (x)
                            (let* ([name (car x)]
                                   [r (subroutine-ref name)]
                                   [new-params ((subroutine-generate-params r) rand-limit)])
                              (cons name
                                    (map (λ (wire new-param)
                                            (if (eq? (car wire) 'static)
                                              (cons 'static (cdr new-param))
                                              wire))
                                         (cdr x) (cons null new-params)))))
                         rs)])
        (if (and (not (equal? rs new-rs)) (routine? new-rs))
          new-rs
          (lp (sub1 depth)))))))


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

; returns #f if incompatible, else a vector of types corresponding to each subroutine's input
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


;;;;;;;;;;;;;;
;;;  UTIL  ;;;
;;;;;;;;;;;;;;

(define (flip [p 0.5])
  (< (random) p))
