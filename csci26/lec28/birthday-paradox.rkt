#lang racket

(define (birthday-paradox n)
  ;; first, get the probability that everyone was born on a different day
  (define everyone-born-on-different-days 1.0)
  (for ([i (in-range 365 (- 365 n) -1)])
    (set! everyone-born-on-different-days
          (* everyone-born-on-different-days
             (/ i 365))))

  (printf "probability of complement: ~a\n" everyone-born-on-different-days)
  (printf "probability: ~a\n" (- 1.0 everyone-born-on-different-days)))

(birthday-paradox 23)
(displayln "")
(birthday-paradox 50)
