#lang racket

(require web-server/templates)

(define routines
  (map path->string
       (directory-list "../src/routines")))

(define (name routine)
  (substring routine 0 (- (string-length routine) 4)))

(define (info routine)
  (eval `(begin
           (require ,(string-append "../src/routines/" routine))
           (list description deps))
        (make-base-namespace)))

(define (routine-docs) ; list of (name description deps)
  (map (λ (r) (cons (name r) (info r)))
       routines))

(define (routine-template r)
  (let* ([routine     (first r)]
         [description (second r)]
         [deps        (third r)]
         [conceptual-dependencies
           (if (empty? deps) "" "Conceptual dependencies:")])
    (include-template "docs_template_routine.md")))

(define (main-template content)
  (include-template "docs_template_main.md"))

(display (main-template (string-join (map routine-template (routine-docs)) "\n"))
         (open-output-file "routines.md" #:exists 'replace))
(display "output written to routines.md\n")
