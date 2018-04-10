"""Call this file after adding a new routine"""

import os.path
HERE = os.path.dirname(os.path.abspath(__file__))
ROUTINES = os.path.join(HERE, "subroutines")


output = []

for entry in sorted(os.scandir(ROUTINES), key=lambda x:x.path):
    if not entry.is_file() or not entry.path.endswith(".rkt"):
        continue
    subroutine = os.path.basename(entry.path)[:-4]
    output.append(f"""
(let ()
  (local-require "subroutines/{subroutine}.rkt")
  (hash-set! all-subroutines '{subroutine}
    (subroutine input output params description deps example-params evaluate generate)))
""")

with open(os.path.join(HERE, "subroutines.rkt"), "w") as f:
    f.write("""#lang racket/base
(provide subroutine?
         subroutine-input
         subroutine-output
         subroutine-params
         subroutine-description
         subroutine-deps
         subroutine-example-params
         subroutine-evaluate
         subroutine-generate)
(provide all-subroutines subroutine-ref)

(struct subroutine (input output params description deps example-params evaluate generate))

(define all-subroutines (make-hash))
(define (subroutine-ref name) (hash-ref all-subroutines name))
""")
    for s in output:
        f.write(s)
    f.write("\n")
