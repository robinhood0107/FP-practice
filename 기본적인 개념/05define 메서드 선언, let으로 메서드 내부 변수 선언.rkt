#lang racket

(define (calculate-sum)
  (let ([x 10]
        [y 20])
    (+ x y)))

(calculate-sum) ; 실제로 출력하려면 이렇게 함수 호출 해줘야 함


;define으로 변수도 선언할 수 있지만 메서드를 선언할 수도 있음
;해당 메서드 안에서 특정 scope에 해당하는 이 부분에서 유효한 지역변수는 let으로 선언한다
#|
int x = 10;
int y = 20;
int result = x + y;

자바는 이런식으로 씀
|#

;let은 대괄호 [] 안에 변수 이름과 값을 쌍으로 묶어 선언하며, 그 다음에 이어지는 본문에서만 해당 변수를 사용할 수 있음