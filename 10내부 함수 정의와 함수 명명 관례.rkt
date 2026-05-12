#lang racket

;내부 함수 정의
;Java의 private 메서드처럼 Racket에서도 함수 내부에서만 사용할 도우미 함수(Helper function)를 정의할 수 있음
;소유권 당연하게 정확히 보는거다

(define (outer-func x)
  (define (inner-func y)
    (+ y 1))
  (inner-func x))

;이렇게 inner-func이라는 이름의 도우미 함수를 outer-func이 함수 안에서 정의하면 이렇게 (inner-func x) 사용할 수 있음




;함수 명명 관례 (Predicate와 ?)
;Racket을 비롯한 Lisp 계열 언어에서는 함수의 반환값이 참(true) 또는 거짓(false)인 불리언(boolean) 타입일 때
;(즉, 출력 값이 bool값이면 함수 이름 끝에 물음표(?)를 붙이는 관례가 있음
;관례니까 꼭 따라줘야지 가독성 올라간다

;이런 bool값을 반환값으로 가지는 함수를 Predicate(서술어)이라고 한다

#|java 명명 규칙
boolean isEmpty(List list) { ... }
boolean hasNext() { ... }
java의 hasNext나 isEmpty와 같은 사용자 함수들의 함수이름 정할 때 is-나 has-와 같은 접두사를 사용하는 것과 같음
|#

(empty? '(1 2 3))    ; 리스트가 비어있는지 확인 (결과: #f)
(zero? 0)            ; 숫자가 0인지 확인 (결과: #t)
(stream-empty? s)    ; 스트림 s가 비어있는지 확인


;목표 : 조건문(if, cond)과 함께 자연스럽게 읽히도록 작성하는 것이 특징이다