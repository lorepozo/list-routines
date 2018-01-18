#lang racket

(require json web-server/templates)

(define (pretty-params h)
  (string-join
    (hash-map h (λ (k v)
                   (if (string? v)
                       (string-append (symbol->string k) "=" v)
                       (string-append (symbol->string k) "=" (jsexpr->string v)))) #t)
    ", "))

(define (info routine-file)
  (eval `(begin
           (require ,(string-append "src/routines/" routine-file))
           (define h (make-hash))
           (hash-set! h 'description description)
           (hash-set! h 'is-parametric is-parametric)
           (hash-set! h 'deps deps)
           (hash-set! h 'evaluate evaluate)
           (hash-set! h 'generate generate)
           (if is-parametric
               (hash-set! h 'example-params example-params)
               (hash-set! h 'examples examples))
           h)
        (make-base-namespace)))

(define routine-docs ; alist of name → hash table
  (map (λ (routine-file)
         (let ([name (substring routine-file 0
                                (- (string-length routine-file) 4))]
               [h    (info routine-file)])
           (cons name h)))
       (filter
         (λ (path) (string-suffix? path ".rkt"))
         (map path->string (directory-list "src/routines")))))


(define (routine-is-parametric routine)
  (hash-ref (cdr (assoc routine routine-docs)) 'is-parametric))

(define (routine-template r)
  (let* ([routine       (car r)]
         [h             (cdr r)]
         [is-parametric (hash-ref h 'is-parametric)]
         [description   (hash-ref h 'description)]
         [deps          (hash-ref h 'deps)]
         [generate      (hash-ref h 'generate)]
         [evaluate      (hash-ref h 'evaluate)]
         [conceptual-dependencies
           (if (empty? deps) "" "Conceptual dependencies:")])
  (if is-parametric
    (let* ([example-params (hash-ref h 'example-params)]
           [examples (map list
                          (map pretty-params example-params)
                          (map (λ (params)
                                  (let* ([inps (generate (hash-set params 'count 3))]
                                         [outs (map (λ (inp) (evaluate inp params)) inps)]
                                         [inps (map jsexpr->string inps)]
                                         [outs (map jsexpr->string outs)])
                                    (map list inps outs)))
                               example-params))])
      (include-template "docs_template_routine_parametric.md"))
    (let* ([examples (hash-ref h 'examples)]
           [examples (map (λ (ex) (map jsexpr->string ex))
                          (map list examples (map evaluate examples)))])
      (include-template "docs_template_routine_nonparametric.md")))))

(define (main-template content)
  (include-template "docs_template_main.md"))

(display (main-template (string-join (map routine-template routine-docs) "\n"))
         (open-output-file "routines.md" #:exists 'replace))
(display "output written to routines.md\n")
