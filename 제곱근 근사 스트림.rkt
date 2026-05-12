#lang racket

;;make-hash으로 해시맵
(define cache (make-hash))

(define (avg a b)
  (/ (+ a b) 2.0))

(define (next g x)
  (avg g (/ x g)))

;; x_n = 1/2 * (x_(n-1) + x / x_(n-1))
(define (make-sqrt x)
  (define gs
    (stream-cons 1.0
                 (stream-map (lambda (g) (next g x))
                             gs)))
  gs)

(define (sqrt-stream x)
  (cond [(not (and (real? x) (> x 0)))
         (error 'sqrt-stream "양의 실수만 사용할 수 있습니다: ~a" x)]
        [else
         (hash-ref! cache
                    x
                    (lambda ()
                      (make-sqrt x)))]))

;; 1. 처음 호출 시 (새로운 스트림 생성됨)
(displayln "=== 첫 번째 호출: (sqrt-stream 2) ===")
(define stream-for-2 (sqrt-stream 2))
(displayln (stream->list (stream-take stream-for-2 5)))

;; 2. 동일한 x값으로 두 번째 호출 시 (캐싱된 스트림 반환 확인)
(displayln "\n=== 두 번째 호출: (sqrt-stream 2) ===")
(define stream-for-2-cached (sqrt-stream 2))
(displayln (stream->list (stream-take stream-for-2-cached 5)))

;; 3. 다른 x값으로 호출 시 (새로운 스트림 생성됨)
(displayln "\n=== 다른 값 호출: (sqrt-stream 9) ===")
(define stream-for-9 (sqrt-stream 9))
(displayln (stream->list (stream-take stream-for-9 5)))
