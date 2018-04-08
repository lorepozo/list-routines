#lang racket/base
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
(require "routines.rkt")

(define (non-parametric-handlers r op inp params)
  (case op
    [("is-parametric") #f]
    [("validate") ((hash-ref r 'validate) inp)]
    [("evaluate") (if ((hash-ref r 'validate) inp)
                      ((hash-ref r 'evaluate) inp)
                      'null)]
    [("examples") (hash-ref r 'examples)]
    [("generate") ((hash-ref r 'generate) params)]
    [("description") (hash-ref r 'description)]
    [else 'null]))
(define (parametric-handlers r op inp params)
  (case op
    [("is-parametric") #t]
    [("validate-params") ((hash-ref r 'validate-params) params)]
    [("validate") (and ((hash-ref r 'validate-params) params)
                       ((hash-ref r 'validate) inp params))]
    [("evaluate") (if (and ((hash-ref r 'validate-params) params)
                           ((hash-ref r 'validate) inp params))
                    ((hash-ref r 'evaluate) inp params)
                    'null)]
    [("example-params") (hash-ref r 'example-params)]
    [("generate") ((hash-ref r 'generate) params)]
    [("description") (hash-ref r 'description)]
    [else 'null]))

(define (interpret-line line callback)
  (with-handlers ([exn:fail? (λ (exn) (display exn (current-error-port)))])
    (let* ([js          (bytes->jsexpr line)]
           [op          (hash-ref js 'op "evaluate")]
           [routine     (hash-ref js 'routine)]
           [inp         (hash-ref js 'input '())]
           [params      (hash-ref js 'params (make-hasheq))]
           [routine     (hash-ref routines (string->symbol routine))]
           [is-parametric (hash-ref routine 'is-parametric)])
      (write-json ((if is-parametric parametric-handlers non-parametric-handlers)
                   routine op inp params))))
  (newline)
  (flush-output)
  (callback))

(define (main)
  (let ([line (read-bytes-line)])
    (if (eof-object? line)
      (exit)
      (interpret-line line main))))
(main)
