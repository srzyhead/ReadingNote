#lang racket

(define (rember a lat)
  (cond
    ((null? lat) `())
    ((eq? a (car lat)) (cdr lat))
    (else (cons (car lat) (rember a (cdr lat))))
    )
  )

(equal? (let ([a `mint] [lat `(lamb chops and mint jelly)]) (rember a lat))
        '(lamb chops and jelly))

(equal? (let ([a `mint] [lat `(lamb chops and mint flavored mint jelly)]) (rember a lat))
        '(lamb chops and flavored mint jelly))

(equal? (let ([a `toast] [lat `(bacon lettuce and tomato)]) (rember a lat))
        '(bacon lettuce and tomato))

(equal? (let ([a `cup] [lat `(coffee cup tea cup and hick cup)]) (rember a lat))
        '(coffee tea cup and hick cup))

#|
The Second Commandment
Use cons to build lists.
|#


(define (firsts l)
  (cond
    ((null? l) `())
    (else (cons (car (car l)) (firsts (cdr l))))
    )
  )

; Why (firsts (cdr /))               Because we can only look at one S-expression at a time. To look at the rest, we must recur.

(equal? (let ([l `((apple peach pumpkin)
                   (plum pear cherry)
                   (grape raisin pea)
                   (bean carrot eggplant))]) (firsts l))
        '(apple plum grape bean))

(equal? (let ([l `((a b) (c d) (e f))]) (firsts l))
        '(a c e))

(equal? (let ([l `()]) (firsts l))
        '())

(equal? (let ([l `((five plums)
                   (four)
                   (eleven green oranges))]) (firsts l))
        '(five four eleven))

(equal? (let ([l `(((five plums) four)
                   (eleven green oranges)
                   ((no) more))]) (firsts l))
        '((five plums) eleven (no)))

(define (seconds l)
  (cond
    ((null? l) `())
    (else (cons (car (cdr (car l))) (seconds (cdr l))))
    )
  )

(equal? (let ([l `((a b) (c d) (e f))]) (seconds l))
        '(b d f))

#|
The Third Commandment
When building a list, describe the first typical ele­ment,and then cons it onto the natural recursion.
|#

(define (insertR new old lat)
  (cond
    ((null? lat) `())
    ((equal? old (car lat)) (cons old (cons new (cdr lat))))
    (else (cons (car lat) (insertR new old (cdr lat))))
    )
  )

(equal? (insertR
         'topping 'fudge
         '(ice cream with fudge for dessert))
        '(ice cream with fudge topping for dessert)
        )

(equal? (insertR
         'jalapeno
         'and
         '(tacos tamales and salsa))
        '(tacos tamales and jalapeno salsa)
        )

(equal? (insertR
         'e
         'd
         '(a b c d f g d h))
        '(a b c d e f g d h)
        )

(define (insertL new old lat)
  (cond
    ((null? lat) `())
    ((equal? old (car lat)) (cons new lat))
    (else (cons (car lat) (insertL new old (cdr lat))))
    )
  )

(equal? (insertL
         'topping 'fudge
         '(ice cream with fudge for dessert))
        '(ice cream with topping fudge for dessert)
        )

(equal? (insertL
         'jalapeno
         'and
         '(tacos tamales and salsa))
        '(tacos tamales jalapeno and salsa)
        )

(equal? (insertL
         'e
         'd
         '(a b c d f g d h))
        '(a b c e d f g d h)
        )

(define (subst new old lat)
  (cond
    ((null? lat) `())
    ((equal? old (car lat)) (cons new (cdr lat)))
    (else (cons (car lat) (subst new old (cdr lat))))
    )
  )

(equal? (subst
         'topping 'fudge
         '(ice cream with fudge for dessert))
        '(ice cream with topping for dessert)
        )

(define (subst2 new o1 o2 lat)
  (cond
    ((null? lat) `())
    ((or (equal? o1 (car lat)) (equal? o2 (car lat))) (cons new (cdr lat)))
    (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
    )
  )

(equal? (subst2
         'vanilla 'chocolate 'banana
         '(banana ice cream with chocolate topping))
        '(vanilla ice cream with chocolate topping)
        )


(define (multirember a lat)
  (cond
    ((null? lat) `())
    ((eq? a (car lat)) (multirember a (cdr lat)))
    (else (cons (car lat) (multirember a (cdr lat))))
    )
  )

(equal? (multirember
         'cup
         '(coffee cup tea cup and hick cup))
        '(coffee tea and hick)
        )


(define (multiinsertR new old lat)
  (cond
    ((null? lat) `())
    ((equal? old (car lat)) (cons old (cons new (multiinsertR new old (cdr lat)))))
    (else (cons (car lat) (multiinsertR new old (cdr lat))))
    )
  )

(equal? (multiinsertR
         'e
         'd
         '(a b c d f g d h))
        '(a b c d e f g d e h)
        )

(define (multiinsertL new old lat)
  (cond
    ((null? lat) `())
    ((equal? old (car lat)) (cons new (cons old (multiinsertL new old (cdr lat)))))
    (else (cons (car lat) (multiinsertL new old (cdr lat))))
    )
  )

(equal? (multiinsertL
         'e
         'd
         '(a b c d f g d h))
        '(a b c e d f g e d h)
        )