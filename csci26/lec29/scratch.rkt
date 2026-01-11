#lang racket

(define total-outcomes 0)
(define outcome-to-count (make-hash))

(for* ([i (in-range 1 7)]
       [j (in-range 1 7)])
  (define event (list i j))
  (define prod (* i j))
  (set! total-outcomes (add1 total-outcomes))

  (define old-count (hash-ref outcome-to-count prod 0))
  (define new-count (+ old-count 1))
  (hash-set! outcome-to-count prod new-count))

(define expected-value 0.0)

;; output the results
(for ([(outcome count) (in-hash outcome-to-count)])
  (printf "~a: ~a\n" outcome count)
  (set! expected-value (+ expected-value (* outcome (/ count total-outcomes)))))

(printf "total outcomes: ~a\n" total-outcomes)
(printf "E[X]: ~a\n" expected-value)
