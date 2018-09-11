(define (gcd a b)
  (if (= b 0) 
      a
      (gcd b (remainder a b))))

(gcd 3 7)
(gcd 96 32)
(gcd 21 49)
(gcd 206 40)
(gcd 40 206)
