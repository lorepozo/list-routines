#lang racket
(require "routine.rkt")
(provide export evaluate generate-examples generate-routines resample-params)

(define (evaluate routine inp)
  (routine-eval routine inp))

(define (generate-examples routine cnt gen-params)
  (map (λ (x) (make-immutable-hash `((i . ,(car x)) (o . ,(cadr x)))))
       (routine-generate-input
         routine
         (append `((count . ,cnt)) (hash-map gen-params cons)))))

(define (resample-params routine rand-limit)
  (let ([new-routine (routine-regenerate-static-params routine rand-limit)])
    (with-output-to-string (λ _ (display new-routine)))))

(define (generate-routines cnt rand-limit uniq do-shuffle)
  (let ([routines (generate-routines cnt rand-limit uniq do-shuffle)])
    (map (λ (r) (with-output-to-string (λ _ (display r)))) routines)))

(define (export r-cnt ex-cnt rand-limit uniq do-shuffle)
  (define (export-data routine)
    (let* ([name (with-output-to-string (λ _ (display routine)))]
           [raw-examples (routine-generate-input routine `((count . ,ex-cnt)))])
      (and raw-examples ; not failure
           (ormap (λ (ex) (not (equal? (car ex) (cadr ex)))) raw-examples) ; not identity
           (or (< (length raw-examples) 2)
               (ormap (λ (ex) (not (equal? (cadar raw-examples) (cadr ex)))) raw-examples)) ; not constant
           (let* ([io-examples (map (λ (x) (make-immutable-hash `(
                                             (i . ,(car x))
                                             (o . ,(cadr x))
                                           )))
                                    raw-examples)]
                  [input-type (if (integer? (caar raw-examples)) "int" "list-of-int")]
                  [output-type (cond
                                 [(integer? (cadar raw-examples)) "int"]
                                 [(list? (cadar raw-examples)) "list-of-int"]
                                 [else "bool"])])
             (make-immutable-hash `(
               (name . ,name)
               (type . ,(make-immutable-hash `(
                 (input . ,input-type)
                 (output . ,output-type)
               )))
               (examples . ,io-examples)
             ))))))
  (filter-map export-data
              (generate-routines r-cnt rand-limit uniq do-shuffle)))
