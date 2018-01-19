#lang racket

(require json racket/cmdline)
(require "../src/racket/routines/main.rkt")

(define TRAIN-GEN-COUNT (make-parameter 5))
(define TEST-GEN-COUNT (make-parameter 10))

(command-line
  #:usage-help "list-routines static dataset generator" ""
  #:once-each
  [("-o" "--output") file
                     "Sends output to <file>."
                     (current-output-port
                       (open-output-file file #:exists 'replace))]
  [("--train") train-count
               ("Generates <train-count> training samples if there are no examples.")
               (TRAIN-GEN-COUNT train-count)]
  [("--test") test-count
               "Generates <test-count> testing samples."
               (TEST-GEN-COUNT test-count)]
  )

(define (english-list l)
  (cond [(empty? l) ""]
        [(= (length l) 1) (first l)]
        [(= 2 (length l))
         (string-append (first l) " and " (second l))]
        [else (string-join (list-set l (sub1 (length l))
                                     (string-append "and " (last l)))
                           ", ")]))

(define (pretty-params h)
  (english-list
    (hash-map h (λ (k v)
                   (if (string? v)
                       (string-append (symbol->string k) "=" v)
                       (string-append (symbol->string k) "=" (jsexpr->string v)))) #t)))


(define (routine-data-parametric name h)
  (let ([nh `#hash((is_parametric . #t)
                   (description . ,(hash-ref h 'description))
                   (dependencies . ,(hash-ref h 'deps)))]
        [make-io (λ (cnt params)
                   (let ([inputs ((hash-ref h 'generate) (hash-set params 'count cnt))])
                     (map (λ (i)
                             (let ([o ((hash-ref h 'evaluate) i params)])
                               `#hash((i . ,i) (o . ,o))))
                          inputs)))])
    (map (λ (params)
           (let ([nh (hash-copy nh)])
             (hash-set! nh 'name (string-append name " with " (pretty-params params)))
             (hash-set! nh 'train (make-io (TRAIN-GEN-COUNT) params))
             (hash-set! nh 'test (make-io (TEST-GEN-COUNT) params))
             nh))
         (hash-ref h 'example-params))))

(define (routine-data-nonparametric name h)
  (let ([make-io (λ (inputs)
                   (map (λ (i)
                           (let ([o ((hash-ref h 'evaluate) i)])
                             `#hash((i . ,i) (o . ,o))))
                        inputs))]
        [nh (make-hash)])
    (hash-set! nh 'name name)
    (hash-set! nh 'is_parametric #f)
    (hash-set! nh 'description (hash-ref h 'description))
    (hash-set! nh 'dependencies (hash-ref h 'deps))
    (hash-set! nh 'train (make-io (hash-ref h 'examples)))
    (hash-set! nh 'test (make-io ((hash-ref h 'generate) `#hash((count . ,(TEST-GEN-COUNT))))))
    nh))

(define (routine-data arg)
  (let ([name (car arg)] [h (cdr arg)])
    (if (hash-ref h 'is-parametric)
      (routine-data-parametric name h)
      (list (routine-data-nonparametric name h)))))

(define alphabetized-routines
  (map (λ (s) (cons s (hash-ref routines (string->symbol s))))
       (sort (map symbol->string (hash-keys routines))
             string<?)))

(write-json (append-map routine-data alphabetized-routines))
