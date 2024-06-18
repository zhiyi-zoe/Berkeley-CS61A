(define (ascending? asc-lst)
 (if (null? asc-lst)
     #t
     (if (null? (cdr asc-lst))
         #t
         (if (> (car asc-lst) (car (cdr asc-lst)))
             #f
             (ascending? (cdr asc-lst))
         )
     )
 )
)

(define (my-filter pred s)
 (if (null? s)
     '()
     (if (pred (car s))
         (cons (car s) (my-filter pred (cdr s)))
         (my-filter pred (cdr s))
     )
 )
)

(define (interleave lst1 lst2)
 (if (null? lst1)
     (if (null? lst2)
         '()
         lst2)
     (if (null? lst2)
         lst1
         (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))
     )
 )
)

(define (no-repeats lst)
 (if (null? lst)
     '()
     (cons (car lst) (no-repeats (my-filter (lambda (x) (not (= x (car lst)))) (cdr lst))))))
