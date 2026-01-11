#lang racket

(define (prime? n)
  (define was-it-prime? #t)

  ;; try all the possible factors between 2 and n-1
  (for ([i (in-range 2 n)])
    ;; see if i divides cleanly into n
    ;; if so, the number isn't prime
    ;; (hint--use remainder (%) in C++!)
    (when (= (modulo n i) 0)
      (set! was-it-prime? #f)))

  ;; if we got here without finding a factor the number is prime
  was-it-prime?)

(displayln (prime? 25))
(displayln (prime? 27))
(displayln (prime? 29))
