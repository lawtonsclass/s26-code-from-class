#lang racket

;; there's no main function!

(define pi 3.14)

(define (print-from-1-to n)
  (cond [(= n 1) (displayln 1)]
        [else (print-from-1-to (- n 1))
              (displayln n)]))

(print-from-1-to 5)


(struct 2d-point (x y)) ;; makes 2d-point-x 2d-point-y 2d-point?

(define p (2d-point 5 7))
(displayln (2d-point-x p))

(define l1 (list 1 2 3))
(define l2 '(1 2 3))

(displayln l1)

;; map applies a function to every element of a list!

(define (add2 n) (+ n 2))

(displayln (map add2 l1))

;; lambdas are *anonymous* functions! They don't have names!

(displayln (map (lambda (x) (+ x 2)) l1))

;; filter extracts all elements of a list for which some function returns true (#t)
(displayln (filter (lambda (x) (> x 1)) l2))
