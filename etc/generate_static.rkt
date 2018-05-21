#lang racket

(require json racket/cmdline)
(require "../src/routine.rkt")

(define ROUTINE-COUNT (make-parameter 1000))
(define EXAMPLE-COUNT (make-parameter 10))
(define UNIQ (make-parameter #f))

(command-line
  #:usage-help "list-routines static dataset generator" ""
  #:once-each
  [("-o" "--output") file
                     "Sends output to <file>."
                     (current-output-port
                       (open-output-file file #:exists 'replace))]
  [("--routines") routine-count
               "Generates a total of <routine-count> routines."
               (ROUTINE-COUNT (string->number routine-count))]
  ; TODO: non-sequential generation
  [("--examples") example-count
               "Generates <example-count> examples for each routine."
               (EXAMPLE-COUNT (string->number example-count))]
  [("-u" "--ensure-unique")
               "Slower generation ensuring routines are unique."
               (UNIQ #t)]
  )

(define (routine-data routine)
  (let* ([name (let ([o (open-output-string)])
                 (display routine o)
                 (get-output-string o))]
         [raw-examples (routine-generate-input routine `((count . ,(EXAMPLE-COUNT))))])
    (and raw-examples ; not failure
         (ormap (λ (ex) (not (eq? (car ex) (cadr ex)))) raw-examples) ; not identity
         (ormap (λ (ex) (not (eq? (cadar raw-examples) (cadr ex)))) raw-examples) ; not constant
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


(write-json (filter-map routine-data (generate-routines (ROUTINE-COUNT) 8 (UNIQ))))
