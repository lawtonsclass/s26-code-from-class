#lang racket

(struct tree (data left right))

(define T1
  (let* ([c (tree 'c null null)] ;; the c leaf node
         [e (tree 'e null null)]
         [g (tree 'g c e)]
         [b (tree 'b null null)]
         [d (tree 'd g b)]) ;; the root
    d))

(define T2
  (let* ([_1 (tree 1 null null)]
         [_5 (tree 5 null null)]
         [_2 (tree 2 _1 _5)]
         [_14 (tree 14 null null)]
         [_9 (tree 9 null _14)]
         [_7 (tree 7 _2 _9)])
    _7))

(define (preorder T)
  (match T
    [(list) (printf "")] ;; do nothing
    [(tree data l r) (printf "~a " data) ;; non-empty tree
                     (preorder l)
                     (preorder r)]))

(define (postorder T)
  (match T
    [(list) (printf "")] ;; do nothing
    [(tree data l r) (postorder l) ;; non-empty tree
                     (postorder r)
                     (printf "~a " data)]))

(define (inorder T)
  (match T
    [(list) (printf "")] ;; do nothing
    [(tree data l r) (inorder l) ;; non-empty tree
                     (printf "~a " data)
                     (inorder r)]))

(preorder T1)
(displayln "")
(postorder T1)
(displayln "")
(inorder T2)
