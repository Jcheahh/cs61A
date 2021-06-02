(define (find s predicate)
  (cond 
    ((null? s) #f)
    ((predicate (car s)) (car s))
    (else (find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (cons-stream (* (car s) k)
      (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
  (define (has-cycle-helper slow fast)
    (cond 
      ((or (null? fast) (null? (cdr-stream fast))) #f)
      ((or (eq? slow fast) (eq? slow (cdr-stream fast))) #t)
      (else (has-cycle-helper (cdr-stream slow) (cdr-stream (cdr-stream fast))))))
  
  (if (null? s)
    #f
    (has-cycle-helper s (cdr-stream s)))
)
(define (has-cycle-constant s)
  (has-cycle s)
)
