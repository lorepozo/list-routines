#lang racket

(require json web-server/templates)
(require "../src/racket/routines/main.rkt")

(define (pretty-params h)
  (string-join
    (hash-map h (λ (k v)
                   (if (string? v)
                       (string-append (symbol->string k) "=" v)
                       (string-append (symbol->string k) "=" (jsexpr->string v)))) #t)
    ", "))

(define (routine-is-parametric routine)
  (hash-ref (hash-ref routines (string->symbol routine)) 'is-parametric))

(define (gen-uniq generate params)
  (let ([h (hash-set params 'count 3)])
    (let lp ([inps (generate h)])
      (if (not (check-duplicates inps))
          inps
          (lp (generate (hash-set params 'count 3)))))))

(define (routine-template routine)
  (let* ([h             (hash-ref routines (string->symbol routine))]
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
                                  (let* ([inps (gen-uniq generate params)]
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

(display (main-template (string-join
                          (map routine-template
                               (sort
                                 (map symbol->string (hash-keys routines))
                                 string<?))
                          "\n"))
         (open-output-file "routines.md" #:exists 'replace))
(display "output written to routines.md\n")
