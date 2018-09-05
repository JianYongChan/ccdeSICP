(define (sum-of-larger-two x y z)
        (if (> x y) (if (> y z) (+ x y) (+ x z))
                        (if (> x z) (+ x y) (+ y z))))

(sum-of-larger-two 37 7 51)
(sum-of-larger-two 7 7 7)
(sum-of-larger-two 3 2 1)
(sum-of-larger-two 7 37 51)

;;; cubic root
(define (cubic x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cubic guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root-iter (improve guess x) x)))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))

;;; square root
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0))
