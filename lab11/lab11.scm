(define (over-or-under num1 num2) 
  (cond 
      ((< num1 num2) -1)
      ((= num1 num2) 0)
      (else 1)))

(define (make-adder num) (lambda (x) (+ x num)))

(define (composed f g) (lambda (x) (f (g x))))

(define (repeat_helper f g n)
  (if (= n 0)
      (lambda (x) (g x))
      (repeat_helper f (composed f g) (- n 1))))

(define (repeat f n) (repeat_helper f f (- n 1)))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE)
