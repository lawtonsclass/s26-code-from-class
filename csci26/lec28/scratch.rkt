#lang racket

(define count 0)

(for* ([i (in-range 1 7)]
       [j (in-range 1 7)]
       [k (in-range 1 7)])
  (cond [(= (+ i j k) 9) (printf "(~a, ~a, ~a)\n" i j k)
                         (set! count (+ count 1))]
        [else null]))

(printf "count: ~a\n" count)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define div-by-3 0)
(define div-by-7 0)
(define div-by-3-and-7 0)

;; returns #t if n is divisible by m
(define (divisible-by n m)
  (= (modulo n m) 0))

(define-syntax-rule (inc! x)
  (set! x (+ x 1)))

(for* ([i (in-range 1 51)])
  (cond [(and (divisible-by i 3) (divisible-by i 7)) (inc! div-by-3)
                                                     (inc! div-by-7)
                                                     (inc! div-by-3-and-7)]
        [(divisible-by i 3) (inc! div-by-3)]
        [(divisible-by i 7) (inc! div-by-7)]
        [else null]))

(printf "divisible by 3: ~a\n" div-by-3)
(printf "divisible by 7: ~a\n" div-by-7)
(printf "divisible by both: ~a\n" div-by-3-and-7)
