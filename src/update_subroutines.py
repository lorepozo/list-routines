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
         subroutine-examples
         subroutine-evaluate
         subroutine-generate-input
         subroutine-generate-param
         subroutine-generate-params)

(require racket/list)
(require "type.rkt")

(struct subroutine (input output params description deps example-params examples evaluate generate))

(define (subroutine-ref name) (hash-ref all-subroutines name))
(define subroutine-generate-input subroutine-generate)
(define ((subroutine-generate-params r) [rand-limit 8] #:weight [weight 0.2])
  (if (< (random) weight) ; use example
      (let* ([example-params (subroutine-example-params r)]
             [len (length example-params)])
        (if (zero? len)
            null
            (list-ref example-params (random len))))
      (map (λ (x) (cons (car x)
                        (gen-param-number (as-type (cdr x)) rand-limit)))
           (subroutine-params r))))
(define ((subroutine-generate-param r) param [rand-limit 8])
  (if (< (random) 0.2) ; use example
      (let* ([example-params (subroutine-example-params r)]
             [params (list-ref example-params (random (length example-params)))])
        (cdr (assoc param params)))
      (gen-param-number (as-type (cdr (assoc param (subroutine-params r))))
                        rand-limit)))

(define all-subroutines (make-hash))
"""

EACH = """
(let ()
  (local-require "subroutines/{subroutine}.rkt")
  (hash-set! all-subroutines '{subroutine}
             (subroutine input output params
                         description deps
                         example-params examples
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
