#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x))
         )))

;(provide (atom? lat?))

(provide (all-defined-out))
