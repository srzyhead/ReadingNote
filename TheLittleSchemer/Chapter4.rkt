#lang racket

(define (add1 n)
  (+ n 1))

(eq? (add1 67) 68)

(define (sub1 n)
  (- n 1))

(eq? (sub1 0) -1)

(zero? 0)


(define (o+ n m)
  (cond
    ((zero? m) n)
    ((positive? m) (o+ (add1 n) (sub1 m)))
    (else (o+ (sub1 n) (add1 m)))
    )
  )

(eq? (o+ 1 2) 3)
(eq? (o+ -1 -2) -3)

; cons builds lists and addl builds numbers.

(define (o- n m)
  (cond
    ((zero? m) n)
    ((positive? m) (o- (sub1 n) (sub1 m)))
    (else (o- (add1 n) (add1 m)))
    )
  )

(eq? (o- 1 2) -1)
(eq? (o- -1 -2) 1)

(define (tup? lst)
  (cond
    ((null? lst) #t)
    ((and (list? lst) (number? (car lst))) (tup? (cdr lst)))
    (else #f)
    )
  )

(eq? (tup? `(8 55 5 555)) #t)
(eq? (tup? `(1 2 8 apple 4 3)) #f)
(eq? (tup? `(3 (7 4) 13 9)) #f)
(eq? (tup? `()) #t)

(define (addtup lst)
  (define (addtup-temp lst1)
    (cond
      ((null? lst1) 0)
      (else (o+ (car lst1) (addtup-temp (cdr lst1))))
      ))
  (if (tup? lst)
      (addtup-temp lst)
      #f)
  )

(eq? (addtup `(8 55 5 555)) 623)
(eq? (addtup `()) 0)
(eq? (addtup `(3 (7 4) 13 9)) #f)

#|
The First Commandment
(first revision)
When recurring on a list of atoms, lat, ask two questions
about it: (null? lat) and else.
When recurring on a number, n, ask two questions about
it: (zero? n) and else.
|#

















