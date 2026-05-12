#lang racket
;리스트와 구조체(class는 객체지향꺼고 class랑 똑같이 사용자 정의 자료형으로 구조체가 있잖음. C 생각해라)



;리스트
;Java에서는 여러 값을 저장하기 위해 배열이나 “ArrayList”를 사용

;Racket에서는 연결 리스트 사용하고 아주 가벼운 가변 자료구조로 "기본적으로 불변"이이라는게 중요함

;java에서는...
#|
import java.util.Arrays;
import java.util.List;

List<Integer> numbers = Arrays.asList(1, 2, 3, 4);
System.out.println(numbers.get(0)); // 첫 번째 요소 접근
|#

;Racket에서는...
;list를 사용하거나 '을 사용하면 됨
;내부 원소 접근은 first랑 rest(first 제외한 나머지 전부)
(define numbers (list 1 2 3 4))
; 또는 (define numbers '(1 2 3 4))

(displayln (first numbers)) ; 첫 번째 요소 접근 (결과: 1)
(displayln (rest numbers))  ; 첫 번째 요소를 제외한 나머지 리스트 (결과: '(2 3 4))




;구조체
;C처럼 구조체 사용해야 함(당연한게 이게 함수형 언어지 객체지향(명령형)은 아니잖음

;java에서는...
#|
class Point {
    int x;
    int y;
    Point(int x, int y) { this.x = x; this.y = y; }
}
Point p = new Point(1, 2);
|#

(struct point (x y))

(define p (point 1 2))
(displayln (point-x p)) ; x 좌표 접근 (결과: 1)
(displayln (point-y p)) ; y 좌표 접근 (결과: 2)

;struct를 정의하면 생성자(point)와 각 필드에 접근할 수 있는 접근자 함수(point-x, point-y)가 자동으로 생성
