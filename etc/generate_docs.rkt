#lang racket

(require json web-server/templates)
(require "../src/subroutines.rkt")

(define (pretty-params params)
  (string-join
    (map (λ (p)
            (let ([k (car p)] [v (cdr p)])
              (if (string? v)
                (string-append (symbol->string k) "=" v)
                (string-append (symbol->string k) "=" (jsexpr->string v)))))
         params)
    ", "))

(define (subroutine-is-parametric subroutine-name)
  (not (empty? (subroutine-params (subroutine-ref (string->symbol subroutine-name))))))

(define (gen-uniq generate params)
  (let ([params (cons '(count . 3) params)])
    (let lp ([inps (generate params)])
      (if (not (check-duplicates inps))
          inps
          (lp (generate params))))))

(define (subroutine-template subroutine-name)
  (let* ([subroutine    (subroutine-ref (string->symbol subroutine-name))]
         [is-parametric (not (empty? (subroutine-params subroutine)))]
         [description   (subroutine-description subroutine)]
         [deps          (subroutine-deps subroutine)]
         [generate      (subroutine-generate-input subroutine)]
         [evaluate      (subroutine-evaluate subroutine)]
         [conceptual-dependencies
           (if (empty? deps) "" "Conceptual dependencies:")])
  (if is-parametric
    (let* ([example-params (subroutine-example-params subroutine)]
           [examples (map list
                          (map pretty-params example-params)
                          (map (λ (params)
                                  (let* ([inps (gen-uniq generate params)]
                                         [outs (map (λ (inp) (evaluate inp params)) inps)]
                                         [inps (map jsexpr->string inps)]
                                         [outs (map jsexpr->string outs)])
                                    (map list inps outs)))
                               example-params))])
      (include-template "docs_template_subroutine_parametric.md"))
    (let* ([examples (gen-uniq generate null)]
           [examples (map (λ (ex) (map jsexpr->string ex))
                          (map list examples (map (λ (x) (evaluate x null)) examples)))])
      (include-template "docs_template_subroutine_nonparametric.md")))))

(define (main-template content)
  (include-template "docs_template_main.md"))

(display (main-template (string-join
                          (map subroutine-template
                               (sort
                                 (map symbol->string (hash-keys all-subroutines))
                                 string<?))
                          "\n"))
         (open-output-file "subroutines.md" #:exists 'replace))
(display "output written to subroutines.md\n")
