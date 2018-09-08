(define (fast-mult a b)
  (fast-mult-iter 0 a b))

(define (fast-mult-iter n a b)
  (cond ((or (= a 0) (= b 0)) n)
        ((even? b) (fast-mult-iter n (double a) (halve b)))
        (else (fast-mult-iter (+ n a) a (- b 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(fast-mult 3 4)
(fast-mult 0 7)
(fast-mult 37 0)
(fast-mult 7 37)
