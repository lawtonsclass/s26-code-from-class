#lang racket

(define (gcd x y)
  (printf "calling (gcd ~a ~a)\n" x y)
  (cond
    [(eq? x 0) y]
    [else (gcd (modulo y x) x)]))

(displayln (gcd 80 61))
(displayln (gcd 12 18))
