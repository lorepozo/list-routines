#lang racket

(require json web-server/templates)

(define (pretty-params h)
  (string-join
    (hash-map h (λ (k v)
                   (if (string? v)
                       (string-append (symbol->string k) "=" v)
                       (string-append (symbol->string k) "=" (jsexpr->string v)))) #t)
    ", "))

(define routines
  (map path->string
       (directory-list "src/routines")))

(define (name routine)
  (substring routine 0 (- (string-length routine) 4)))

(define (info routine)
  (eval `(begin
           (require racket/hash ,(string-append "src/routines/" routine))
           (list is-parametric description deps
                 (if is-parametric
                     (map list
                          example-params
                          (map (λ (params)
                                  (let ([inps
                                          (generate (hash-union params #hash((count .  3))))])
                                    (map list inps (map (λ (inp)
                                                           (evaluate inp params))
                                                        inps))))
                               example-params))
                     (map list examples (map evaluate examples)))))
        (make-base-namespace)))

(define routine-docs ; list of (name is-parametric description deps example-IO-pairs/example-params)
  (map (λ (r) (cons (name r) (info r)))
       routines))

(define (routine-is-parametric routine)
  (first (assoc routine routine-docs)))

(define (routine-template r)
  (let* ([routine       (first r)]
         [is-parametric (second r)]
         [description   (third r)]
         [deps          (fourth r)]
         [conceptual-dependencies
           (if (empty? deps) "" "Conceptual dependencies:")])
    (if is-parametric
        (let ([example-params (map (λ (e)
                                      (list (pretty-params (first e))
                                            (map (λ (ex) (map jsexpr->string ex)) (second e))))
                                   (fifth r))])
          (include-template "docs_template_routine_parametric.md"))
        (let ([examples (map (λ (ex) (map jsexpr->string ex)) (fifth r))])
          (include-template "docs_template_routine_nonparametric.md")))))

(define (main-template content)
  (include-template "docs_template_main.md"))

(display (main-template (string-join (map routine-template routine-docs) "\n"))
         (open-output-file "routines.md" #:exists 'replace))
(display "output written to routines.md\n")
