;;; 对于任意的x，y和m
;;; 都有(x * y) % m = ((x % m) * (y % m)) % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          ;;; 本来base应该是(remainder base m)
          ;;; 但是base<m，所以直接写base
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

;;; (random n)返回区间[0, n)的数
;;; 所以为了得到[1, n)的数，需要(+ 1 (random (- n 1)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;;; times表示要进行费马检查的次数
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(define (prime? n)
  (fast-prime? n 7))

(prime? 37)
(prime? 51)
(prime? 13)
(prime? 71)
(prime? 7317)
