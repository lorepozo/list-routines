#lang racket/base
; JSON-based REPL.
;
; INPUT json:
;     { "op": <str>, ...<REST> }
;
; OUTPUT json:
; (ROUTINE is of the form described in README.md.)
; (all return null if invalid, see stderr for reason.)
; op = evaluate
;     REST = { "routine": <ROUTINE>, "input": <list/number> }
;     => <output>
; op = generate-examples
;     REST = { "routine": <ROUTINE>, "count": <number>, ["gen-params": <obj>={}] }
;     => list of {"i": <list/number>, "o": <output>}
; op = resample-params
;     REST = { "routine": <ROUTINE>, ["rand-limit": <number>=8] }
;     => <ROUTINE>
; op = generate-routines
;     REST = { "count": <number>, ["rand-limit": <number>=8], ["no-shuffle": <bool>=#f] }
;     => list of <ROUTINE>

(require racket/port json)
(require "api.rkt")

(define (evaluate-handler j)
  (let ([routine (with-input-from-string (hash-ref j 'routine) read)]
        [inp (hash-ref j 'input)])
    (evaluate routine inp)))

(define (generate-examples-handler j)
  (let ([routine (with-input-from-string (hash-ref j 'routine) read)]
        [cnt (hash-ref j 'count)]
        [gen-params (hash-ref j 'gen-params (make-immutable-hash))])
    (generate-examples routine cnt gen-params)))

(define (resample-params-handler j)
  (let ([routine (with-input-from-string (hash-ref j 'routine) read)]
        [rand-limit (hash-ref j 'rand-limit 8)])
    (resample-params routine rand-limit)))

(define (generate-routines-handler j)
  (let ([cnt (hash-ref j 'count)]
        [rand-limit (hash-ref j 'rand-limit 8)]
        [do-shuffle (not (hash-ref j 'no-shuffle #f))])
    (generate-routines cnt rand-limit #f do-shuffle)))

(define HANDLERS (make-immutable-hash `(
  ("evaluate"          . ,evaluate-handler)
  ("generate-examples" . ,generate-examples-handler)
  ("resample-params"   . ,resample-params-handler)
  ("generate-routines" . ,generate-routines-handler)
)))
(define (get-handler op) (hash-ref HANDLERS op))

(define (interpret-line line callback)
  (with-handlers ([exn:fail? (λ (exn) (display exn (current-error-port)))])
    (let* ([j       (bytes->jsexpr line)]
           [op      (hash-ref j 'op)]
           [handler (get-handler op)])
      (write-json (handler j))))
  (newline)
  (flush-output)
  (callback))

(define (repl)
  (let ([line (read-bytes-line)])
    (if (eof-object? line)
      (exit)
      (interpret-line line repl))))
(repl)
