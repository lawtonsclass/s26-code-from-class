#lang racket

(require math/number-theory)

;; first try 21 then try 41
(for ([n (in-range 1 41)])
  (define a_n (+ (* n n) n 41))
  (printf "a_~a = ~a, (~a)\n" n a_n (prime? a_n)))
