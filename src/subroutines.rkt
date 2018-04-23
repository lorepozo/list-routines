#lang racket/base
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
         subroutine-generate-param
         subroutine-generate-params)

(require racket/list)
(require "type.rkt")

(struct subroutine (input output params description deps example-params evaluate generate))

(define (subroutine-ref name) (hash-ref all-subroutines name))
(define subroutine-generate-input subroutine-generate)
(define ((subroutine-generate-params r) [rand-limit 8])
  (if (< (random) 0.2) ; use example
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

(let ()
  (local-require "subroutines/add-k.rkt")
  (hash-set! all-subroutines 'add-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/append-k.rkt")
  (hash-set! all-subroutines 'append-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/count-k.rkt")
  (hash-set! all-subroutines 'count-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/dedup.rkt")
  (hash-set! all-subroutines 'dedup
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/drop-k.rkt")
  (hash-set! all-subroutines 'drop-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/dup.rkt")
  (hash-set! all-subroutines 'dup
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/empty.rkt")
  (hash-set! all-subroutines 'empty
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/fibonacci.rkt")
  (hash-set! all-subroutines 'fibonacci
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/has-k.rkt")
  (hash-set! all-subroutines 'has-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/head.rkt")
  (hash-set! all-subroutines 'head
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/identify-geq-k.rkt")
  (hash-set! all-subroutines 'identify-geq-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/identify-is-mod-k.rkt")
  (hash-set! all-subroutines 'identify-is-mod-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/identify-is-prime.rkt")
  (hash-set! all-subroutines 'identify-is-prime
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/identify-k.rkt")
  (hash-set! all-subroutines 'identify-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/index-k.rkt")
  (hash-set! all-subroutines 'index-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/intersperse-k.rkt")
  (hash-set! all-subroutines 'intersperse-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/is-evens.rkt")
  (hash-set! all-subroutines 'is-evens
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/is-mod-k.rkt")
  (hash-set! all-subroutines 'is-mod-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/is-odds.rkt")
  (hash-set! all-subroutines 'is-odds
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/is-primes.rkt")
  (hash-set! all-subroutines 'is-primes
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/is-squares.rkt")
  (hash-set! all-subroutines 'is-squares
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/keep-evens.rkt")
  (hash-set! all-subroutines 'keep-evens
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/keep-mod-k.rkt")
  (hash-set! all-subroutines 'keep-mod-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/keep-odds.rkt")
  (hash-set! all-subroutines 'keep-odds
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/kth-largest.rkt")
  (hash-set! all-subroutines 'kth-largest
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/kth-smallest.rkt")
  (hash-set! all-subroutines 'kth-smallest
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/last.rkt")
  (hash-set! all-subroutines 'last
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/len.rkt")
  (hash-set! all-subroutines 'len
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/max.rkt")
  (hash-set! all-subroutines 'max
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/min.rkt")
  (hash-set! all-subroutines 'min
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/modulo-k.rkt")
  (hash-set! all-subroutines 'modulo-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/mult-k.rkt")
  (hash-set! all-subroutines 'mult-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/pop.rkt")
  (hash-set! all-subroutines 'pop
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/pow-base-k.rkt")
  (hash-set! all-subroutines 'pow-base-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/pow-k.rkt")
  (hash-set! all-subroutines 'pow-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/prepend-k.rkt")
  (hash-set! all-subroutines 'prepend-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/prime-largest-less-than.rkt")
  (hash-set! all-subroutines 'prime-largest-less-than
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/prime.rkt")
  (hash-set! all-subroutines 'prime
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/product.rkt")
  (hash-set! all-subroutines 'product
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/range.rkt")
  (hash-set! all-subroutines 'range
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/remove-mod-k.rkt")
  (hash-set! all-subroutines 'remove-mod-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/repeat-k.rkt")
  (hash-set! all-subroutines 'repeat-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/replace-all-k-with-n.rkt")
  (hash-set! all-subroutines 'replace-all-k-with-n
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/replace-index-k-with-n.rkt")
  (hash-set! all-subroutines 'replace-index-k-with-n
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/reverse.rkt")
  (hash-set! all-subroutines 'reverse
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/rotate-k.rkt")
  (hash-set! all-subroutines 'rotate-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/slice-k-n.rkt")
  (hash-set! all-subroutines 'slice-k-n
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/sort.rkt")
  (hash-set! all-subroutines 'sort
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/sum.rkt")
  (hash-set! all-subroutines 'sum
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/tail.rkt")
  (hash-set! all-subroutines 'tail
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/take-k.rkt")
  (hash-set! all-subroutines 'take-k
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

(let ()
  (local-require "subroutines/uniq.rkt")
  (hash-set! all-subroutines 'uniq
             (subroutine input output params
                         description deps example-params
                         evaluate generate)))

