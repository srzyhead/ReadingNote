#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x))
         )))

(define (rember* a l)
  (cond
    ((null? l) '())
    ((and (list? l) (equal? a (car l))) (rember* a (cdr l)) )
    ((list? l) (cons (rember* a (car l)) (rember* a (cdr l))) )
    (else l)
    )
  )

(equal? (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)) '((coffee) ((tea)) (and (hick))))
(equal? (rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))) '(((tomato)) ((bean)) (and ((flying)))))

(define (insertR* new old l)
  (cond
    ((null? l) '())
    ((and (list? l) (equal? old (car l)))
     (cons old (cons new (insertR* new old (cdr l)))) )
    ((list? l)
     (cons (insertR* new old (car l)) (insertR* new old (cdr l))) )
    (else l)
    )
  )

(equal?
 (insertR*
  'roast
  'chuck
  '((how much (wood)) could ((a (wood) chuck)) (((chuck)))
                      (if (a) ((wood chuck))) could chuck wood))
 '((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast)))
                     (if (a) ((wood chuck roast))) could chuck roast wood)
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
; The first commandment (final version)                                      ;
;                                                                            ;
; When recurring on a list of atoms, lat, ask two questions about it:        ;
; (null? lat) and else.                                                      ;
; When recurring on a number, n, ask two questions about it: (zero? n) and   ;
; else.                                                                      ;
; When recurring on a list of S-expressions, l, ask three questions about    ;
; it: (null? l), (atom? (car l)), and else.                                  ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
; Why all *-functions similar?                                               ;
;                                                                            ;
; Because all *-functions work on lists that are either                      ;
; - empty,                                                                   ;
; - an atom consed onto a list, or                                           ;
; - a list consed onto a list.                                               ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
; The fourth commandment (final version)                                     ;
;                                                                            ;
; Always change at least one argument while recurring. When recurring on a   ;
; list of atoms, lat, use (cdr l). When recurring on a number, n, use        ;
; (sub1 n). And when recurring on a list of S-expressions, l, use (car l)    ;
; and (cdr l) if neither (null? l) nor (atom? (car l)) are true.             ;
;                                                                            ;
; It must be changed to be closer to termination. The changing argument must ;
; be tested in the termination condition:                                    ;
; * when using cdr, test the termination with null? and                      ;
; * when using sub1, test termination with zero?.                            ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (occur* a l)
  (cond
    ((null? l) 0)
    ((atom? l) (if (eq? a l) 1 0))
    (else (+ (occur* a (car l)) (occur* a (cdr l))))
    )
  )

(equal?
 (occur*
  'banana
  '((banana)
    (split ((((banana ice)))
            (cream (banana))
            sherbet))
    (banana)
    (bread)
    (banana brandy)))
 5)


; The subst* function substitutes all olds for news in l
;
(define (subst* new old l)
  (cond
    ((atom? l) (if (eq? old l) new l) )
    ((null? l) `())
    (else (cons (subst* new old (car l)) (subst* new old (cdr l))) )
    )
  )

; Example of subst*
;
(equal? (subst*
         'orange
         'banana
         '((banana)
           (split ((((banana ice)))
                   (cream (banana))
                   sherbet))
           (banana)
           (bread)
           (banana brandy)))
        '((orange) (split ((((orange ice))) (cream (orange)) sherbet)) (orange) (bread) (orange brandy))
        )

; The insertL* function insers new to the left of all olds in l
;
(define (insertL* new old l)
  (cond
    ((null? l) `())
    ((atom? (car l))
     (if (eq? old (car l))
         (cons new (cons old (insertL* new old (cdr l))))
         (cons (car l) (insertL* new old (cdr l)))
         ))
    (else
     (cons (insertL* new old (car l)) (insertL* new old (cdr l))))
    )
  )

; Example of insertL*
;
(equal?
 (insertL*
  'pecker
  'chuck
  '((how much (wood)) could ((a (wood) chuck)) (((chuck)))
                      (if (a) ((wood chuck))) could chuck wood))
 '((how much (wood))
   could
   ((a (wood) pecker chuck))
   (((pecker chuck)))
   (if (a) ((wood pecker chuck)))
   could pecker chuck wood)
 )

; The member* function determines if element is in a list l of s-exps
;
(define (member* a l)
  (cond
    ((null? l) #f)
    ((atom? l) (if (eq? l a) #t #f))
    (else
     (or (member* a (car l)) (member* a (cdr l))))
    )
  )

; Example of member*
;
(equal?
 (member*
  'chips
  '((potato) (chips ((with) fish) (chips))))
 #t)

; The leftmost function finds the leftmost atom in a non-empty list
; of S-expressions that doesn't contain the empty list
;
(define (leftmost l)
  (cond
    ((null? l) #f)
    ((atom? l) l)
    (else (leftmost (car l)))
    )
  )

; Examples of leftmost
;
(equal?
 (leftmost '((potato) (chips ((with) fish) (chips))))
 'potato)
(equal?
 (leftmost '(((hot) (tuna (and))) cheese))
 'hot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
; The sixth commandment                                                      ;
;                                                                            ;
; Simplify only after the function is correct.                               ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; rember simplified, it now also works on s-expressions, not just atoms
;
(define (rember s l)
  (cond
    ((null? l) '())
    ((equal? (car l) s) (cdr l))
    (else (cons (car l) (rember s (cdr l))))))

; Example of rember
;
(equal?
 (rember
  '(foo (bar (baz)))
  '(apples (foo (bar (baz))) oranges))
 '(apples oranges)
 )
