(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(* 3 4)
(* 37 7)

(define (fast-mult a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))


(define (even? b)
  (= (remainder b 2) 0))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(fast-mult 3 4)
(fast-mult 0 7)
(fast-mult 37 0)
(fast-mult -3 4)
(fast-mult -4 3)
