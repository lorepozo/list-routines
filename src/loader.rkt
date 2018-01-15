#lang racket
; INPUT json:
;     { "op": <str>,
;       "routine": <str>,
;       "input": <list/number>,
;       "params": {obj}  // for generate, can specify "count" or routine-specific param
;     }
; OUTPUT json:
; op = validate => bool
; op = evaluate => null if invalid, else routine output
; op = generate => list of routine inputs
; op = examples => list of routine inputs
; op = description => string
; op = is-parametric => bool
; op = validate-params => bool
; op = example-params => list of objects

(require json)

(define allowed-requires-std '("src/prelude.rkt" math/distributions))
(define allowed-requires-routines
  (map (λ (p) (string-append "src/routines/" (path->string p)))
       (directory-list "src/routines")))
(define allowed-requires (append allowed-requires-std allowed-requires-routines))

(define (non-parametric-handlers evaluator op inp params)
  (case op
    [("is-parametric") #f]
    [("validate") (evaluator `(validate ',inp))]
    [("evaluate") (evaluator `(let ([inp ',inp])
                                (if (validate inp)
                                    (evaluate inp)
                                    'null)))]
    [("examples") (evaluator 'examples)]
    [("generate") (evaluator `(generate ,params))]
    [("description") (evaluator 'description)]
    [else 'null]))
(define (parametric-handlers evaluator op inp params)
  (case op
    [("is-parametric") #t]
    [("validate-params") (evaluator `(let ([inp ',inp] [params ,params])
                                       (validate-params params)))]
    [("validate") (evaluator `(let ([inp ',inp] [params ,params])
                                (and (validate-params params)
                                     (validate inp params))))]
    [("evaluate") (evaluator `(let ([inp ',inp] [params ,params])
                                (if (and (validate-params params)
                                         (validate inp params))
                                    (evaluate inp params)
                                    'null)))]
    [("example-params") (evaluator 'example-params)]
    [("generate") (evaluator `(generate ,params))]
    [("description") (evaluator 'description)]
    [else 'null]))

(define (interpret-line line callback)
  (with-handlers ([exn:fail? (λ (exn) (display exn (current-error-port)))])
    (let* ([js          (bytes->jsexpr line)]
           [op          (hash-ref js 'op "evaluate")]
           [routine     (hash-ref js 'routine)]
           [inp         (hash-ref js 'input '())]
           [params      (hash-ref js 'params (make-hasheq))]
           [ns          (make-base-namespace)]
           [evaluator   (λ (expr) (eval expr ns))])
      (evaluator `(require ,(string-append "src/routines/" routine ".rkt")))
      (write-json ((if (evaluator 'is-parametric) parametric-handlers non-parametric-handlers)
                   evaluator op inp params))))
  (newline)
  (flush-output)
  (callback))

(define (main)
  (let ([line (read-bytes-line)])
    (if (eof-object? line)
      (exit)
      (interpret-line line main))))
(main)
