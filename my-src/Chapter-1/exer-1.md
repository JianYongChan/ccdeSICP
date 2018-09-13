# Exercise

* exer1-1:

``` Scheme
10
12
8
3
6
a
b
19
#f
4
16
16
```

* exer1-2:

``` Scheme
(\ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
```


* exer1-3:

``` Scheme
(define (sum-of-larger-two x y z)
        (if (> x y) (if (> y z) (+ x y) (+ x z))
                    (if (> x z) (+ x y) (+ y z))))
```

* exer1-4:

``` Scheme
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
```

上面这个过程实际上是`a+abs(b)`

* exer1-5:

```Scheme
(define (p) (p))

(define (test x y)
    (if (= x 0) 0 y))

(test 0 (p))
```

`应用序求值`指的是解释器首先对运算符和各个运算对象求值，然后将得到的过程应用于得到的实际的参数；而`正则序求值`则是用运算对象表达式去代换形参，直至得到一个只包含基本运算符的表达式，然后再执去执行求值。

如果是`应用序求值`，则会陷入无穷递归中；如果是`正则序求值`，则会得到0值

* exer1-6:

``` Scheme
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))
```

* exer1-8

``` Scheme
(define (cubic x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cubic guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root-iter (improve guess x)
                       x)))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))
```

* exer1-9

``` Scheme
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
```

对于`(+ 4 5)`而言，两个过程的代换模型分别为：

``` Scheme
;;; procedure 1
;;; 其计算过程是线性递归的
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;;; procedure 2
;;; 其计算过程是迭代的
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```

* exer1-10

``` Scheme
;;; Ackermann
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
```

各个表达式的值：

``` Scheme
(A 1 10) = 1024
(A 2 4) = 65536
(A 3 3) = 65536
```

下面各个函数的数学定义：

``` Scheme
(define (f n) (A 0 n))  ;;; ==> 2n
(define (g n) (A 1 n))  ;;; ==> 
(define (h n) (A 2 n))  ;;; ==>
```

* exer1-11

``` Scheme
;;; 递归计算过程版本
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3))))

;;; 迭代计算过程版本
(define (f n)
  (f-iter 0 1 2 n))

(define (f-iter f0 f1 f2 count)
  (cond ((= count 2) f2)
        ((= count 1) f1)
        ((= count 0) f0)
        (else (f-iter f1 f2 (+ f2 (* f1 2) (* f0 3)) (- count 1)))))
```

* exer1-15

``` Scheme
;;; a) 5次
(sine 12.15)
    (p (sine 4.05))
        (p (sine 1.35))
            (p (sine 0.45))
                ((p (sine 0.15)))
                    (p (sine 0.05))

;;; b) 这个问题可以这样理解：a被3除多少次才会<=0.1？
;;; 即：a/(3^n) <= 0.1 ==> n >= log_3(10a)
```
* exer1-16

``` Scheme
(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
         ((even? n) (fast-expt-iter a (square b) (/ n 2)))
         (else (fast-expt-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))
```

* exer1-17

``` Scheme
(define (fast-mult a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        ((even? b) (fast-mult (* a 2) (/ b 2)))
        (else (+ a (fast-mult a (- b 1))))))


(define (even? b)
  (= (remainder b 2) 0))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))
```

* exer1-18

``` Scheme
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
```

* exer1-19

``` Scheme
```

* exer1-20

正则序：3次
应用序：3次

* exer1-21

``` Scheme
(define (smallest-divisor n)
  (define (divides? a b)
    (= (remainder a b) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor ) n) n)
          ((divides? n test-divisor) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

(smallest-divisor 199)      ;;; 199
(smallest-divisor 1999)     ;;; 1999
(smallest-divisor 19999)    ;;; 7
```
