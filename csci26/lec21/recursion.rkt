#lang racket

(define (min-list L)
  (printf "calling min-list with ~a\n" L)

  (cond
    ;; base case:
    ;; if L's length is one, give back the one thing inside--that's the min
    [(= 1 (length L)) (first L)]
    [else
     ;; recursive case:
     ;; recursively find the min of the smaller list
     (define min-rest (min-list (rest L)))
     (if (< (first L) min-rest)
         (first L)
         min-rest)]))

; (displayln (min-list '(8 6 7 5 3 0 9)))

;;;;;;;;;;;;;;;;;;

;; binary search for val in a vector v
(define (binary-search v val)
  (binary-search-helper v 0 (- (vector-length v) 1) val))

;; searches v for val between start-idx and end-idx
(define (binary-search-helper v start-idx end-idx val)
  (printf "calling binary-search-helper ~a ~a ~a ~a\n" v start-idx end-idx val)

  (cond
    ;; if the search space is empty, val doesn't exist
    ;; return -1
    [(> start-idx end-idx) -1]
    ;; otherwise, find the midpoint of the current search space and
    ;; figure out which way to search
    [else
     (define mid-idx (quotient (+ start-idx end-idx) 2)) ;; halfway in between start and end
     (define mid (vector-ref v mid-idx)) ;; the element at the midpoint
     (cond
       ;; search left if val is smaller than mid
       [(< val mid) (binary-search-helper v start-idx (- mid-idx 1) val)]
       ;; search right if val is larger than mid
       [(> val mid) (binary-search-helper v (+ mid-idx 1) end-idx val)]
       ;; otherwise we found the value!
       ;; return the mid-idx when val = mid
       [else mid-idx])]))

; (displayln (binary-search (vector 1 2 3 4 5) -4))

;;;;;;;

(define (merge-sort L)
  (printf "calling merge-sort on ~a\n" L)

  (define sz (length L))
  (cond
    [(<= sz 1) L] ;; an empty or single-element list is already sorted
    [else
      (define half-sz (quotient sz 2))

      ;; split the list L into the first and second half
      (define left-half (take L half-sz))
      (define right-half (drop L half-sz))

      ;; recursively sort the left and right halves
      (define left-sorted (merge-sort left-half))
      (define right-sorted (merge-sort right-half))

      ;; merge the two sorted halves
      (merge left-sorted right-sorted)]))


;; merge together two sorted sub-lists
(define (merge l r)
  (printf "calling merge on ~a and ~a\n" l r)

  ;; figure out if l or r is empty
  (define l-empty? (empty? l))
  (define r-empty? (empty? r))

  (cond
    ;; if neither of them are empty,
    [(and (not l-empty?) (not r-empty?))
     (define l-first (first l))
     (define r-first (first r))

     ;; Figure out the smallest element and make sure it's the first
     ;; thing in the merged list.
     ;; Then, recursively merge the remaining elements.
     (if (< l-first r-first)
         (cons l-first (merge (rest l) r))
         (cons r-first (merge l (rest r))))]
    ;; if only l is non-empty, then just return l
    [(not l-empty?) l]
    ;; otherwise, just return r
    [else r]))

(displayln (merge-sort '(4 2 3 1)))
