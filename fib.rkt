#lang racket

;; 두 스트림의 같은 위치에 있는 원소들을 더하여 새로운 스트림을 반환하는 함수
(define (add-streams s1 s2)
  (cond [(stream-empty? s1) s2]
        [(stream-empty? s2) s1]
        [else
         (stream-cons (+ (stream-first s1) (stream-first s2))
                      (add-streams (stream-rest s1) (stream-rest s2)))]))

;; 피보나치 수열 무한 스트림 정의
(define fibs
  (stream-cons 0
               (stream-cons 1
                            (add-streams fibs (stream-rest fibs)))))

;; ----------------------------------------------------
;; 테스트 출력
;; ----------------------------------------------------

(displayln "=== 피보나치 수열 스트림 (처음 15개 항) ===")
;; 출력 예상: '(0 1 1 2 3 5 8 13 21 34 55 89 144 233 377)
(displayln (stream->list (stream-take fibs 15)))