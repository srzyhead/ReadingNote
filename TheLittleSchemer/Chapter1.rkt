#lang racket

(require 2htdp/universe)

(define atom?
        (
          lambda (x)
                 (and (not (pair? x))
                      (not (null? x))
                      )))

(atom? 'atom)
(atom? "turkey")
(atom? 1492)
(atom? "u")
(atom? "u")
(atom? "•abc$")
(list? `(atom))
(list? `(atom turkey or))
;;(list? `(atom turkey ) or)
(list? `((atom turkey) or))
(list? `((atom turkey) or))
(sexp? "xyz")
(sexp? `(x y z))
(sexp? `((x y) z))

(define (count-sexp? lst)
        (if (or (not (list? lst)) (empty? lst))
          0
          (if (sexp? (first lst))
            (+ 1 (count-sexp? (rest lst)))
            (count-sexp? (rest lst))
            )
          )
        )

(count-sexp? `(how are you doing so far))

(list? `(((how) are) ((you) (doing so)) far))
(length `(((how) are) ((you) (doing so)) far))
(list? `())
(atom? `())
(list? `(()()()()))
(car `(a b c))
(car `((a b c) x y z))
;;(car `hotdog)
;;(car `())

#|
The Law of Car
The primitive car is defined
only for non-empty lists.
|#

(car `(((hotdogs)) (and) (pickle) relish))
(car (car `(((hotdogs)) (and))))
(cdr `(a b c))
(cdr `((a b c) x y z))
(cdr `(hamburger))
(cdr `((x) t r))
;;(cdr `hotdogs)
;;(cdr `())


#|
The Law of Cdr
The primitive cdr is defined only for
non-empty lists. The cdr of any non­
empty list is always another list.
|#

(car (cdr `((b) (x y) ((c)))))
(cdr (cdr `((b) (x y) ((c)))))
;;(cdr (car `(a (b (c)) d)))
(cons `peanut `(butter and jelly))
(cons `(banana and) `(peanut butter and jelly))
(cons `((help) this) `(is very ((hard) to learn)))
(cons `(a b (c)) `())
(cons `a `())
;;(cons `((a b c)) `b)
;;(cons `a `b)

#|
The Law o f Cons
The primitive cons takes two arguments.
The second argument to cons must be a
list. The result is a list.
|#

(cons `a (car `((b) c d)))
(cons `a (cdr `((b) c d)))
(null? `())
(null? `spaghetti) ;;(null? a) is false for everything, except the empty list.

#|
T he Law o f N ull?
The primitive null? is de­
fined only for lists.
|#

(atom? `Harry)
(atom? (car `(Harry had a heap of apples)))
(atom? (cdr `(Harry had a heap of apples)))
(atom? (car (cdr `(swing low sweet cherry oat))))
(atom? (car (cdr `(swing (low sweet) cherry oat))))
(eq? `Harry `Harry)
(eq? `() `(strawberry)) ;; Two lists are eq? if they are the same list.
(eq? 6 7) ;; some numbers may be arguments of eq?

#|
The Law of Eq?
The primitive eq? takes two ar­
guments. Each must be a non­
numeric atom.
|#

(eq? (car l) a)
