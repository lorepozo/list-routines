#lang racket

(require web-server/templates)
(require "../src/racket/routines/main.rkt")

(define routine-names
  (sort (map symbol->string (hash-keys routines))
        string<?))

(define routine-numbers ; hashtable of name → number
  (let ([h (make-hash)] [numbering 0])
    (map (λ (r)
            (set! numbering (+ numbering 1))
            (hash-set! h r numbering))
         routine-names)
    h))

(define (r:number routine)
  (hash-ref routine-numbers routine))
(define (r:deps routine)
  (hash-ref (hash-ref routines (string->symbol routine)) 'deps))

(define first-line (string-join routine-names))
(define later-lines
  (map (λ (r)
          (string-append (number->string (r:number r)) ": "
                         (string-join
                           (map number->string
                                (map r:number (r:deps r))))))
       (filter (λ (r) (not (empty? (r:deps r))))
               routine-names)))

(define out (open-output-file "routines.graph" #:exists 'replace))
(display first-line out)
(newline out)
(for-each (λ (l) (display l out) (newline out)) later-lines)
(display "output written to routines.graph\n")
