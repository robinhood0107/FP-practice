#lang racket

;차수 무한 stream
(define (ints-from n)
  (stream-cons n (ints-from (+ n 1))))

(define ns (ints-from 0))

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

(define (sign n)
  (if (even? n) 1 -1))

(define (mk-series coeff)
  (stream-map coeff ns))

(define (sin-c n)
  (if (odd? n)
      (/ (sign (quotient (- n 1) 2))
         (fact n))
      0))

(define (cos-c n)
  (if (even? n)
      (/ (sign (quotient n 2))
         (fact n))
      0))

(define sine-series (mk-series sin-c))
(define cosine-series (mk-series cos-c))

(struct term (n c) #:transparent)

(define (tag-n s [n 0])
  (stream-cons (term n (stream-first s))
               (tag-n (stream-rest s) (+ n 1))))

(define (nz? t)
  (not (zero? (term-c t))))

(define (val t x)
  (* (term-c t)
     (expt x (term-n t))))

(define (eval-series s x n)
  (define vals
    (stream-take
     (stream-map (lambda (t) (val t x))
                 (stream-filter nz? (tag-n s)))
     n))
  (apply + (stream->list vals)))


(define pi 3.141592653589793)

(displayln "=== 사인 함수 근사 (x = pi/4) ===")
(displayln (format "실제 내장 함수 값: ~a" (sin (/ pi 4))))
(displayln (format " 5항 근사값      : ~a" (eval-series sine-series (/ pi 4) 5)))
(displayln (format "10항 근사값      : ~a" (eval-series sine-series (/ pi 4) 10)))
(displayln (format "20항 근사값      : ~a" (eval-series sine-series (/ pi 4) 20)))

(displayln "\n=== 코사인 함수 근사 (x = pi/3) ===")
(displayln (format "실제 내장 함수 값: ~a" (cos (/ pi 3))))
(displayln (format " 5항 근사값      : ~a" (eval-series cosine-series (/ pi 3) 5)))
(displayln (format "10항 근사값      : ~a" (eval-series cosine-series (/ pi 3) 10)))
(displayln (format "20항 근사값      : ~a" (eval-series cosine-series (/ pi 3) 20)))
