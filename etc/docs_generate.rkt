#lang racket

(require web-server/templates)

(define routines
  (map path->string
       (directory-list "../src/routines")))

(define (name routine)
  (substring routine 0 (- (string-length routine) 4)))

(define (description routine)
  (eval `(begin
           (require ,(string-append "../src/routines/" routine))
           description)
        (make-base-namespace)))

(define (routine-docs)
  (map (λ (r) (list (name r) (description r)))
       routines))

(define (routine-template r)
  (let ([routine     (first r)]
        [description (second r)])
    (include-template "docs_template_routine.md")))

(define (main-template content)
  (include-template "docs_template_main.md"))

(display (main-template (string-join (map routine-template (routine-docs)) "\n"))
         (open-output-file "routines.md" #:exists 'replace))
(display "output written to routines.md\n")
