#lang racket/base
; use this to generate static exports of samples from this dataset or to simply
; interact with the dataset.
; $ racket src/main_cli.rkt --help

(require racket/list racket/port racket/cmdline json)
(require "api.rkt")

(define EXAMPLE-COUNT (make-parameter 10))
(define ROUTINE-COUNT (make-parameter 400))
(define UNIQ (make-parameter #f))
(define DO-SHUFFLE (make-parameter #t))
(define GEN-PARAMS (make-parameter (make-immutable-hash)))
(define RAND-LIMIT (make-parameter 8))


(command-line
 #:usage-help "list-routines CLI"
 "See the 'export' subcommand for large dataset exports"
 "See the 'generate-routines' subcommand for only sampling routines"
 "See the 'evaluate' subcommand for routine-specific evaluation"
 "See the 'generate-examples' subcommand for routine-specific example generation"
 "See the 'resample-params' subcommand for routine-specific parameter resampling"
 ""
 #:args (command . rst)
 (case command
   [("export")
    (command-line
      #:program "lr-cli export"
      #:argv rst
      #:usage-help "list-routines CLI: dataset export operation" ""
      #:once-each
      [("-o" "--output") file
                         "Sends output to <file>. (default: STDOUT)."
                         (current-output-port
                           (open-output-file file #:exists 'replace))]
      [("--routines") routine-count
                   "Generates a total of <routine-count> routines. (default: 400)"
                   (ROUTINE-COUNT (string->number routine-count))]
      [("--examples") example-count
                   "Generates <example-count> examples for each routine. (default: 10)"
                   (EXAMPLE-COUNT (string->number example-count))]
      [("--rand-limit") rand-limit
                   "Limits the size of random numbers in static parameters. (default: 8)".
                   (RAND-LIMIT (string->number rand-limit))]
      [("--ensure-unique")
                   "Slower generation ensuring routines are unique."
                   (UNIQ #t)]
      [("--no-shuffle")
                   "Disables shuffling so the generated routines are consistent up to parameter bindings."
                   (DO-SHUFFLE #f)]
      #:args ()
      (write-json (export (ROUTINE-COUNT) (EXAMPLE-COUNT) (RAND-LIMIT) (UNIQ) (DO-SHUFFLE)))
      )
    ]
   [("evaluate")
    (command-line
      #:program "lr-cli evaluate"
      #:argv rst
      #:usage-help "list-routines CLI: evaluate routine" ""
      #:args (routine inp)
      (let ([routine (with-input-from-string routine read)]
            [inp (with-input-from-string inp read)])
        (write-json (evaluate routine inp))))]
   [("generate-examples")
    (command-line
      #:program "lr-cli generate-examples"
      #:argv rst
      #:usage-help "list-routines CLI: generate routine examples" ""
      #:once-each
      [("-c" "--count") example-count
                   "Generates <example-count> examples for the routine. (default: 10)"
                   (EXAMPLE-COUNT (string->number example-count))]
      [("--gen-params") gen-params
                   "Supply routine-specific generation parameters, such as 'len', as JSON key/value pairs in an object (default: {})"
                   (GEN-PARAMS (string->jsexpr gen-params))]
      #:args (routine)
      (let ([routine (with-input-from-string routine read)])
        (write-json (generate-examples routine (EXAMPLE-COUNT) (GEN-PARAMS))))
      )
    ]
   [("resample-params")
    (command-line
      #:program "lr-cli resample-params"
      #:argv rst
      #:usage-help "list-routines CLI: resample static routine params" ""
      #:once-each
      [("--rand-limit") rand-limit
                   "Limits the size of random numbers in static parameters. (default: 8)".
                   (RAND-LIMIT (string->number rand-limit))]
      #:args (routine)
      (let ([routine (with-input-from-string routine read)])
        (write-json (resample-params routine (RAND-LIMIT))))
      )
    ]
   [("generate-routines")
    (command-line
      #:program "lr-cli generate-routines"
      #:argv rst
      #:usage-help "list-routines CLI: routine generation" ""
      #:once-each
      [("-c" "--count") routine-count
                   "Generates a total of <routine-count> routines. (default: 400)"
                   (ROUTINE-COUNT (string->number routine-count))]
      [("--rand-limit") rand-limit
                   "Limits the size of random numbers in static parameters. (default: 8)".
                   (RAND-LIMIT (string->number rand-limit))]
      [("--ensure-unique")
                   "Slower generation ensuring routines are unique."
                   (UNIQ #t)]
      [("--no-shuffle")
                   "Disables shuffling so the generated routines are consistent up to parameter bindings."
                   (DO-SHUFFLE #f)]
      #:args ()
      (write-json (generate-routines (ROUTINE-COUNT) (RAND-LIMIT) (UNIQ) (DO-SHUFFLE)))
      )
    ]
   [else (raise "unknown subcommand")]))
