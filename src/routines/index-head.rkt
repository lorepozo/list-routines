#lang racket
(provide validate evaluate examples generate)

(require "../prelude.rkt")

(define (validate l) (and (list? l) (andmap integer? l)
                          (> (length l) 1)
                          (> (car l) 0)
                          (<= (car l) (length (cdr l)))))
(define (evaluate l) (list-ref (cdr l) (- (car l) 1)))
(define (examples) '((1 1 2) (1 2 3) (2 1 2) (2 3 4) (3 1 3 4 2) (4 2 6 10 8 12)))
(define generate (generate-many
  (λ (params)
     (let ([len (hash-ref params 'len (random 1 8))])
       (append (list (random 1 (+ 1 len)))
               (random-list #:len len))))))
