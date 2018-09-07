(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (expt b n)
  (expt-iter b 1 n))

(define (expt-iter b product count)
  (if (= count 0)
      product
      (expt-iter b (* b product) (- count 1))))

(expt 2 3)
(expt 3 4)


