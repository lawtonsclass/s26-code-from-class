#lang racket

(define wins-staying 0)
(define wins-changing 0)

(define total-simulations 1000000)

(define (simulate)
  (define door-that-contains-car (random 1 4))
  (define door-that-we-pick (random 1 4))

  ;; see if we won by staying
  (if (= door-that-we-pick door-that-contains-car)
      (set! wins-staying (add1 wins-staying))
      null)

  (define doors-to-reveal
    (filter (lambda (x)
              (and (not (= x door-that-contains-car))
                   (not (= x door-that-we-pick))))
            '(1 2 3)))

  (define door-revealed-to-us
    (first (shuffle doors-to-reveal)))

  (define door-we-can-change-to
    (first (filter (lambda (x)
                     (and (not (= x door-revealed-to-us))
                          (not (= x door-that-we-pick))))
                   '(1 2 3))))

  ;; see if we won by switching
  (if (= door-we-can-change-to door-that-contains-car)
      (set! wins-changing (add1 wins-changing))
      null))

(define (run-simulations)
  ;; set back to 0 just in case we run it again
  (set! wins-staying 0)
  (set! wins-changing 0)

  (for ([i (in-range total-simulations)])
    (simulate))

  ;; print results
  (printf "Wins staying: ~a\n" wins-staying)
  (printf "  Probability: ~a\n" (exact->inexact (/ wins-staying total-simulations)))
  (printf "Wins changing: ~a\n" wins-changing)
  (printf "  Probability: ~a\n" (exact->inexact (/ wins-changing total-simulations))))

(run-simulations)
