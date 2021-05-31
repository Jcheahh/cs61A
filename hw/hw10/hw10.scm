(define (accumulate combiner start n term)
  (if (= n 0)
      start
        (accumulate combiner (combiner start (term n)) (- n 1) term)
  )
)

(define (accumulate-tail combiner start n term)
  (if (= n 0)
      start
        (accumulate combiner (combiner start (term n)) (- n 1) term)
  )
)

(define-macro (list-of expr for var in seq if filter-fn)
  `(map (lambda (,var) ,expr) (filter (lambda (,var) ,filter-fn) ,seq))
)

; (list-of (* x x) for x in '(3 4 5) if (odd? x))

; (filter (lambda (x) (odd? x)) (map (lambda (x) (* x x)) '(3 4 5)))

; (filter filter-fn (map expr seq))

; (define-macro (x
;   '(y)))

; (x)

; (y)
