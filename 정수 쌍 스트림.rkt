#lang racket

;; n부터 시작하는 자연수 무한 스트림
(define (ints-from n)
  (stream-cons n (ints-from (+ n 1))))

(define integers (ints-from 1))

;스트림 번갈아가며 섞기
(define (interleave s1 s2)
  (cond [(stream-empty? s1) s2]
        [(stream-empty? s2) s1]
        [else
         (stream-cons (stream-first s1)
                      (interleave s2 (stream-rest s1)))]))

(define (pairs s t)
  (stream-cons
   (list (stream-first s) (stream-first t))
   (interleave
    (stream-map (lambda (x) (list (stream-first s) x))
                (stream-rest t))
    (pairs (stream-rest s) (stream-rest t)))))

(define ps (pairs integers integers))


(define (merge-weighted s1 s2 wt)
  (cond [(stream-empty? s1) s2]
        [(stream-empty? s2) s1]
        [else
         (let ([a (stream-first s1)]
               [b (stream-first s2)])
           (cond [(<= (wt a) (wt b))
                  (stream-cons a
                               (merge-weighted (stream-rest s1) s2 wt))]
                 [else
                  (stream-cons b
                               (merge-weighted s1 (stream-rest s2) wt))]))]))

(define (weighted-pairs s t wt)
  (stream-cons
   (list (stream-first s) (stream-first t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-first s) x))
                (stream-rest t))
    (weighted-pairs (stream-rest s) (stream-rest t) wt)
    wt)))

(define (w p)
  (+ (first p) (second p)))

(define wps
  (weighted-pairs integers integers w))

(displayln "=== 일반 pairs 스트림 (처음 15개) ===")
;; 출력 예상: ((1 1) (1 2) (2 2) (1 3) (2 3) (1 4) (3 3) (1 5) (2 4) (1 6) (3 4) (1 7) (2 5) (1 8) (4 4))
(displayln (stream->list (stream-take ps 15)))

(displayln "\n=== 가중치(i+j) 순 pairs 스트림 (처음 15개) ===")
;; 출력 예상: ((1 1) (1 2) (1 3) (2 2) (1 4) (2 3) (1 5) (2 4) (3 3) (1 6) (2 5) (3 4) (1 7) (2 6) (3 5))
(displayln (stream->list (stream-take wps 15)))
