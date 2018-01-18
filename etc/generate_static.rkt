#lang racket

(require json racket/cmdline)

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


(define (info routine-file)
  (eval `(begin
           (require racket/hash ,(string-append "src/routines/" routine-file))
           (define h (make-hash))
           (hash-set! h 'description description)
           (hash-set! h 'is-parametric is-parametric)
           (hash-set! h 'deps deps)
           (hash-set! h 'evaluate evaluate)
           (hash-set! h 'generate generate)
           (if is-parametric
               (hash-set! h 'example-params example-params)
               (hash-set! h 'examples examples))
           h)
        (make-base-namespace)))

(define routines ; returns alist of name → hash table
  (map (λ (routine-file)
         (let ([name (substring routine-file 0
                                (- (string-length routine-file) 4))]
               [h    (info routine-file)])
           (cons name h)))
       (filter
         (λ (path) (string-suffix? path ".rkt"))
         (map path->string (directory-list "src/routines")))))

(define (routine-data-parametric r)
  (let* ([h (cdr r)]
         [name (car r)]
         [nh `#hash((is_parametric . #t)
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
(define (routine-data-nonparametric r)
  (let* ([h (cdr r)]
         [name (car r)]
         [make-io (λ (inputs)
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
(define (routine-data r)
  (if (hash-ref (cdr r) 'is-parametric)
      (routine-data-parametric r)
      (list (routine-data-nonparametric r))))

(write-json (append-map routine-data routines))
