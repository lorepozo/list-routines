"""Call this file after adding a new routine"""

import os.path
HERE = os.path.dirname(os.path.abspath(__file__))
ROUTINES = os.path.join(HERE, "subroutines")

TOP = """#lang racket/base
(provide subroutine-ref all-subroutines)
(provide subroutine?
         subroutine-input
         subroutine-output
         subroutine-params
         subroutine-description
         subroutine-deps
         subroutine-example-params
         subroutine-evaluate
         subroutine-generate-input
         subroutine-generate-params)

(struct subroutine (input output params description deps example-params evaluate generate))

(define (subroutine-ref name) (hash-ref all-subroutines name))
(define subroutine-generate-input subroutine-generate)
(define ((subroutine-generate-params r) [rand-limit 8])
  (if (flip 0.2) ; use example
      (let* ([example-params (subroutine-example-params r)]
             [len (length example-params)])
        (if (zero? len)
            null
            (list-ref example-params (random len))))
      (map (λ (x) (cons (car x)
                        (gen-param (cadr x) rand-limit)))
           (subroutine-params r))))

(define (gen-param tp-label rand-limit)
  (cond [(eq? tp-label 'int)
         (random (- rand-limit) rand-limit)]
        [(eq? tp-label 'nonnegative)
         (random rand-limit)]
        [(eq? tp-label 'positive)
         (random 1 rand-limit)]
        [else ; (eq? tp-label 'nonzero)
         (let lp ()
           (let ([r (random (- rand-limit) rand-limit)])
             (if (zero? r)
                 (lp)
                 r)))]))

(define (flip [p 0.5])
  (< (random) p))

(define all-subroutines (make-hash))
"""

EACH = """
(let ()
  (local-require "subroutines/{subroutine}.rkt")
  (hash-set! all-subroutines '{subroutine}
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))
"""


with open(os.path.join(HERE, "subroutines.rkt"), "w") as f:
    f.write(TOP)
    for entry in sorted(os.scandir(ROUTINES), key=lambda x:x.path):
        if not entry.is_file() or not entry.path.endswith(".rkt"):
            continue
        subroutine = os.path.basename(entry.path)[:-4]
        f.write(EACH.format(subroutine=subroutine))
    f.write("\n")
