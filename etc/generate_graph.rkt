#lang racket

(require web-server/templates)

(define (name routine)
  (substring routine 0 (- (string-length routine) 4)))

(define (dependencies routine)
  (eval `(begin
           (require ,(string-append "src/routines/" routine))
           deps)
        (make-base-namespace)))

(define routines ; list of (name number deps)
  (let ([numbering 0])
    (map (λ (r)
            (set! numbering (+ numbering 1))
            (list (name r) numbering (dependencies r)))
         (map path->string (directory-list "src/routines")))))

(define (routine-number routine)
  (second (assoc routine routines)))

(define first-line (string-join (map first routines)))
(define later-lines (map (λ (info)
                            (string-append
                              (number->string (second info))
                              ": "
                              (string-join (map number->string (map routine-number (third info))))))
                         (filter (λ (info) (not (empty? (third info)))) routines)))

(define out (open-output-file "routines.graph" #:exists 'replace))
(display first-line out)
(newline out)
(for-each (λ (l) (display l out) (newline out)) later-lines)
(display "output written to routines.graph\n")
