#lang racket/base
(provide routine
         routine?
         routine-valid?
         routine-eval)

(require "subroutines.rkt")

; a routine is a list with elements the form (n . l) where n is the name, as a
; symbol, of the subroutine and l is a list of arguments with length params+1,
; each either ('static . value) or ('dyn . i) where i corresponds to:
;   0 for the overall input.
;   n for the output of the (n-1)th node.
; for example:
;   '((index-k (dyn . 0) (static . 3)) (add-k (dyn . 0) (dyn . 1)))
;   adds the 3rd number of a list to each of its members.

(define (routine? r)
  (and (known-subroutines? r)
       (connected? r)
       (type-static-valid? r)
       (type-dyn-valid? r)))

(define (known-subroutines? r)
  (andmap (λ (x) (hash-has-key? all-subroutines (car x))) r))

(define (connected? r)
  (let ([l (make-list (length (r)) #f)])
    (for-each
      (λ (n)
         (for-each
           (λ (x)
              (if (eq? (car x) 'dyn)
                  (list-set! l (cdr x) #t)))
           (cdr n)))
      (routine-nodes r))
    (andmap identity l)))

(define (type-static-valid? r)
  (let ([l (make-list (length (r)) #f)])
    (andmap
      (λ (n)
         (let ([r (routine-ref (car n))])
           (andmap
             (λ (x tp)
                (if (eq? (car x) 'static)
                    (value-has-type? (cdr x) tp)
                    #t))
             (cdr n)
             (append* (list (routine-input r)) (map cdr (routine-params r))))))
      (routine-nodes r))))

(define (type-valid? rs)
  (let lp ([rs (reverse rs)] [tps (make-list (length r) '(all))])
    (and (andmap (λ (x) (not (empty? x))) tps)
         (if (null? rs)
             #t
             (let ([r (routine-ref (caar rs))])
               (if (subtype? (routine-output r) (last tps))
                   (begin
                     (for-each
                       (λ (x expected)
                          (if (eq? (car x) 'dyn)
                              (let ([i (cdr x)])
                                (list-set! tps i (type-product expected (list-ref tps i))))))
                       (cadr rs) (append* (list (routine-input r)) (map cdr (routine-params r))))
                     (lp (cdr rs) tps))))))))

; useful for types:
;(require "subroutines.rkt")
;(remove-duplicates (append* (hash-map all-subroutines
;  (lambda (_ r)
;    (append* (subroutine-input r)
;             (subroutine-output r)
;             (map cdr (subroutine-params r)))))))
(define (subtype? t1 t2)
  (let ([t1 (if (pair? t1) (car t1) t1)])
    (cond
      [(eq? t1 t2) #t]
      [(eq? t1 'no-smaller)
       (not (not (member t2
        '(int-list length-add1 length-mul))))]
      [else #f]
      )))

;    int-list
;    no-smaller
;    same-length
;    length-sub1
;    length-add1
;    (length-at-least k)
;    (length-at-least-sum (k n 1))
;    (length-mul k)
;    each-non-negative
;    elements
;    binary
;    int
;    element
;    positive
;    int-at-least-3
;    non-negative
;    bool
;    non-zero

(define (type-product t1s t2s)
  (filter (λ (t1) (andmap (λ (t2) (subtype? t1 t2)) t2s))
          t1s))

(define (subtype? t1 t2)
  #f) ; TODO

(define (value-has-type? x t2)
  #t) ; TODO
