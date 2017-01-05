#lang racket

(define (add1 n)
  (+ n 1))

(equal? (add1 67) 68)

(define (sub1 n)
  (- n 1))

(equal? (sub1 0) -1)

(zero? 0)


(define (o+ n m)
  (cond
    ((zero? m) n)
    ((positive? m) (o+ (add1 n) (sub1 m)))
    (else (o+ (sub1 n) (add1 m)))
    )
  )

(equal? (o+ 1 2) 3)
(equal? (o+ -1 -2) -3)

; cons builds lists and addl builds numbers.

(define (o- n m)
  (cond
    ((zero? m) n)
    ((positive? m) (o- (sub1 n) (sub1 m)))
    (else (o- (add1 n) (add1 m)))
    )
  )

(equal? (o- 1 2) -1)
(equal? (o- -1 -2) 1)

(define (tup? lst)
  (cond
    ((null? lst) #t)
    ((and (list? lst) (number? (car lst))) (tup? (cdr lst)))
    (else #f)
    )
  )

(eq? (tup? '(8 55 5 555)) #t)
(eq? (tup? '(1 2 8 apple 4 3)) #f)
(eq? (tup? '(3 (7 4) 13 9)) #f)
(eq? (tup? '()) #t)

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

(equal? (addtup '(8 55 5 555)) 623)
(equal? (addtup '()) 0)
(equal? (addtup '(3 (7 4) 13 9)) #f)

#|
The First Commandment
(first revision)
When recurring on a list of atoms, lat, ask two questions
about it: (null? lat) and else.
When recurring on a number, n, ask two questions about
it: (zero? n) and else.
|#


#|
The Fourth Commandment
(first revision)
Always change at least one argument while recurring. It
must be changed to be closer to termination. The changing
argument must be tested in the termination condition:
when using cdr, test termination w ith null? and
when using s u b l, test termination with zero?.
|#

(define (o* n m)
  (cond
    ((zero? m) 0)
    (else (+ n (o* n (sub1 m))))
    )
  )

(equal? (o* 123 3) 369)

#|
The Fifth Commandment
When building a value with + , always use 0 for the value of the terminating line, for adding 0 does not change the value of an addition.
When building a value with x , always use 1 for the value of the terminating line, for multiplying by 1 does not change the value of a multiplication.
When building a value with cons ,always consider () for the value of the terminating line.
|#

(define (tup+ tup1 tup2)
  (cond
    ((null? tup1) tup2)
    ((null? tup2) tup1)
    (else (cons
           (+ (car tup1) (car tup2))
           (tup+ (cdr tup1) (cdr tup2))
           ))
    )
  )


(equal? (tup+ '(2 3) '(4 6)) '(6 9))
(equal? (tup+ '(2 3 8 1) '(4 6)) '(6 9 8 1))

(define (o> m n)
  (cond
    ((zero? m) #f)
    ((zero? n) #t)
    (else (o> (sub1 m) (sub1 n)))
    )
  )

(equal? (o> 1 2) #f)
(equal? (o> 12345 2) #t)
(equal? (o> 2 2) #f)

(define (o< m n)
  (cond
    ((zero? m) #t)
    ((zero? n) #f)
    (else (o< (sub1 m) (sub1 n)))
    )
  )

(equal? (o< 1 2) #t)
(equal? (o< 12345 2) #f)
(equal? (o< 2 2) #t)

(define (o= m n)
  (cond
    ((and (zero? m) (zero? n)) #t)
    ((zero? n) #f)
    ((zero? m) #f)
    (else (o= (sub1 m) (sub1 n)))
    )
  )

(equal? (o= 1 2) #f)
(equal? (o= 12345 2) #f)
(equal? (o= 2 2) #t)

(define (o-expt m n)
  (cond
    ((zero? n) 1)
    (else (* m (o-expt m (sub1 n))))
    )
  )

(equal? (o-expt 2 2) 4)
(equal? (o-expt 2 3) 8)

(define (length lat)
  (cond
    ((null? lat) 0)
    (else (+ 1 (length (cdr lat))))
    )
  )

(equal? (length '(1 2 3)) 3)
(equal? (length '()) 0)

(define (pick n lat)
  (cond
    ((zero? (sub1 n)) (car lat))
    (else (pick (sub1 n) (cdr lat)))
    )
  )

(equal? (pick 1 '(1 2 3)) 1)

(define (rempick n lat)
  (cond
    ((zero? (sub1 n)) (cdr lat))
    (else (cons (car lat) (rempick (sub1 n) (cdr lat))))
    )
  )

(equal? (rempick 1 '(1 2 3)) '(2 3))

(define (no-nums lat)
  (cond
    ((null? lat) '())
    ((number? (car lat)) (no-nums (cdr lat)) )
    (else (cons (car lat) (no-nums (cdr lat))) )
    )
  )

(equal? (no-nums '(1 asdf 2 3)) '(asdf))


(define (all-nums lat)
  (cond
    ((null? lat) '())
    ((not (number? (car lat))) (all-nums (cdr lat)) )
    (else (cons (car lat) (all-nums (cdr lat))) )
    )
  )

(equal? (all-nums '(1 asdf 2 3)) '(1 2 3))

(define (occur a lat)
  (cond
    ((null? lat) 0)
    ((eq? (car lat) a) (+ 1 (occur a (cdr lat))) )
    (else (occur a (cdr lat)) )
    )
  )

(equal? (occur 1 '(1 asdf 2 3 1)) 2)

(define (one? n) (= n 1))

(define (rempick2 n lat)
  (cond
    ((one? n) (cdr lat))
    (else (cons (car lat) (rempick2 (sub1 n) (cdr lat))))
    )
  )

(equal? (rempick2 1 '(1 2 3)) '(2 3))