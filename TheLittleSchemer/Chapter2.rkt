#lang racket

;; recursion

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x))
         )))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

(let ([l `(Jack Sprat could eat no chicken fat)])
  (lat? l))

(let ([l `((Jack) Sprat could eat no chicken fat)])
  (lat? l))

(let ([l `(Jack (Sprat could) eat no chicken fat)])
  (lat? l))

(let ([l `()])
  (lat? l))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f )
      (else (or (eq? (car lat) a)
               (member? a (cdr lat)))))))


(member? `meat `(mashed potatoes and meat gravy))

#|
The First Commandment
Always ask null? as the first question in expressing any function.
|#
