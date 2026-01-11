#lang racket

(define (print-possibilities unchosen-vars chosen-vars)
  (cond
    [(empty? unchosen-vars)
     ;; base case: unchosen-vars is empty (we've chosen everything)
     ;; print out the current chosen-vars
     (displayln (reverse chosen-vars))]
    [else
     ;; recursive case: unchosen-vars is nonempty
     ;; take one var out of unchosen-vars, and put it into chosen vars
     ;; (trying each possibility)

     ;; to extract the first thing in the list, we use first
     (define var (first unchosen-vars))
     ;; to get everything except the first element, use rest
     (define rest-of-vars (rest unchosen-vars))

     ;; try the three possibilities for the var
     ;; cons adds an element to the front of a list (and it also makes pairs)
     (print-possibilities rest-of-vars (cons `(,var "A") chosen-vars)) #| try A |#
     (print-possibilities rest-of-vars (cons `(,var "B") chosen-vars)) #| try B |#
     (print-possibilities rest-of-vars (cons `(,var "C") chosen-vars)) #| try C |# ]))

(define (print-possibilities-prettier vars)
  (print-possibilities vars '()))

;; initially, everything is unchosen and nothing is chosen
(print-possibilities '("x" "y" "z") '())

;; could also call the prettier version with:
;; (print-possibilities-prettier '("x" "y" "z"))
