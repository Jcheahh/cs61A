; Q4
(define (rle s)
  (define (go x xs n)
    (cond
      ((null? xs) (cons-stream (list x n) nil))
      ((= (car xs) x) (go x (cdr-stream xs) (+ n 1)))
      (else (cons-stream (list x n) (go (car xs) (cdr-stream xs) 1)))))
  (if (null? s)
    '()
    (go (car s) (cdr-stream s) 1))
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  (define (res n s ls)
    (cond ((null? s) (append ls (list n)))
    ((> (car s) n) (append ls (cons n s)))
    (else (res n (cdr s) (append ls (list (car s)))))))
  
  (res n s '())
)

; Q6
(define (deep-map fn s)
  (cond 
    ((null? s) '())
    ((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
    (else (cons (fn (car s)) (deep-map fn (cdr s)))))
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (unique s)
  'YOUR-CODE-HERE
  nil
)

(define (count name s)
  (cond 
    ((null? s) 0)
    ((eq? (car s) name) (+ 1 (count name (cdr s))))
    (else (count name (cdr s))))
)

(define (tally names)
  (if (null? names)
    '()
    (cons 
      (cons 
        (car names) 
        (count (car names) names)
      )
      (tally
        (filter
          (lambda (x) (not (eq? (car names) x))) 
          (cdr names)))
    )
  )
)
