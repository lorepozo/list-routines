"""Call this file after adding a new routine"""

import os.path
HERE = os.path.dirname(os.path.abspath(__file__))
ROUTINES = os.path.join(HERE, "routines")


output = []

for entry in sorted(os.scandir(ROUTINES), key=lambda x:x.path):
    if not entry.is_file() or not entry.path.endswith(".rkt"):
        continue
    routine = os.path.basename(entry.path)[:-4]
    if routine == "main" or routine == "prelude":
        continue
    output.append(f"""
(let ()
  (local-require "{routine}.rkt")
  (set! h (make-hash))
  (hash-set! h 'description description)
  (hash-set! h 'is-parametric is-parametric)
  (hash-set! h 'deps deps)
  (hash-set! h 'validate validate)
  (hash-set! h 'evaluate evaluate)
  (hash-set! h 'generate generate)
  (if is-parametric
      (begin
        (hash-set! h 'example-params example-params)
        (hash-set! h 'validate-params validate-params))
      (hash-set! h 'examples examples))
  (hash-set! routines '{routine} h)
)
""")

with open(os.path.join(ROUTINES, "main.rkt"), "w") as f:
    f.write("""#lang racket
(provide routines)

(define routines (make-hash))
(define h null)
(define validate-params null)
(define example-params null)
(define examples null)

""")
    for s in output:
        f.write(s)
    f.write("\n")
