#lang racket

(define G
  '(['a {('b 0.5) ('c 3) ('e 0)}]
    ['b {('a 0.5) ('e 0.7)}]
    ['c {('a 3) ('d -4.1) ('e 2)}]
    ['d {('c -4.1) ('e 1) ('f 11)}]
    ['e {('a 0) ('b 0.7) ('c 2) ('d 1) ('f 7) ('g -1)}]
    ['f {('d 11) ('e 7) ('j 3)}]
    ['g {('e -1) ('h 4) ('i -1) ('j 0.2)}]
    ['h {('g 4)}]
    ['i {('g -1) ('j -2)}]
    ['j {('f 3) ('g 0.2) ('i -2)}]))

(define (prim G)
  ;; T's vertices and edges start out as ∅
  (define T-vertices (mutable-set))
  (define T-edges (mutable-set))

  (define n (length G))

  ;; take the first vertex from G and add it to T
  (let ([first-vertex (first (first G))])
    (set-add! T-vertices first-vertex))

  (for ([i (in-range 1 n)])
    (printf "i = ~a\n" i)
    (define edges-across-boundary (get-edges-across-boundary G T-vertices))
    (define min-edge (get-min-edge edges-across-boundary))
    ;; add the edge to T-edges and the other vertex to T-vertices
    (set-add! T-edges min-edge)
    (printf "min-edge: ~a\n" min-edge)
    ;; one of (first/second min-edge) is already in T-vertices
    (set-add! T-vertices (first min-edge))
    (set-add! T-vertices (second min-edge)))

  ;; the resulting tree can be deduced from its edges, so that can be what we return
  T-edges)

(define (get-edges-across-boundary G vertices-on-one-side)
  (define (get-edges G)
    ;; iterate through the graph and give back a list of (start end weight) tuples
    (apply append
     (for/list ([start-vertex+adjacency-list G])
      (define start-vertex (first start-vertex+adjacency-list))
      (define adjacency-list (second start-vertex+adjacency-list))
      (for/list ([end-vertex+weight adjacency-list])
          (define end-vertex (first end-vertex+weight))
          (define weight (second end-vertex+weight))
          ;; finally we have a start vertex, an end vertex, and a weight for that edge
          (list start-vertex end-vertex weight)))))

  (define (across-boundary edge)
    (match edge
      [(list start end weight)
       (or
        (and (set-member? vertices-on-one-side start) (not (set-member? vertices-on-one-side end)))
        (and (set-member? vertices-on-one-side end) (not (set-member? vertices-on-one-side start))))]))

  (filter across-boundary (get-edges G)))

(define (get-min-edge edges-across-boundary)
  (define edges-sorted (sort edges-across-boundary (lambda (x y) (< (third x) (third y)))))
  (first edges-sorted))



(displayln (prim G))
