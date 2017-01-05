#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x))
         )))

(provide (all-defined-out))
