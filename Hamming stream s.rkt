#lang racket

;; 1. 스트림의 각 원소에 상수를 곱하는 함수
(define (scale-stream s factor)
  (if (stream-empty? s)
      empty-stream
      (stream-cons (* (stream-first s) factor)
                   (scale-stream (stream-rest s) factor))))

;; 2. 두 오름차순 스트림을 병합하고 중복을 제거하는 함수
(define (merge s1 s2)
  (cond [(stream-empty? s1) s2]
        [(stream-empty? s2) s1]
        [else
         (let ([car-s1 (stream-first s1)]
               [car-s2 (stream-first s2)])
           (cond [(< car-s1 car-s2)
                  (stream-cons car-s1 (merge (stream-rest s1) s2))]
                 [(> car-s1 car-s2)
                  (stream-cons car-s2 (merge s1 (stream-rest s2)))]
                 [else ;; 두 값이 같을 경우 중복을 제거하기 위해 한 번만 포함
                  (stream-cons car-s1 (merge (stream-rest s1) (stream-rest s2)))]))]))

;; 3. 조건에 따른 자기참조 무한 스트림 S 정의
(define S
  (stream-cons 1
               (merge (scale-stream S 2)
                      (merge (scale-stream S 3)
                             (scale-stream S 5)))))

;; ----------------------------------------------------
;; 테스트 출력
;; ----------------------------------------------------
(displayln "=== 해밍 수 스트림 S (처음 20개) ===")
;; 출력 예상: '(1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 27 30 32 36)
(displayln (stream->list (stream-take S 20)))