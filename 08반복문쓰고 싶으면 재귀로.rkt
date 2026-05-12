#lang racket

;함수형에서는 반복문 사용 안하고 재귀 사용한다는거 꼭 기억하셈

(define (sum n)            ;sum이라는 함수를 정의하고, 숫자 n을 입력받음
  (if (= n 0)              ;만약 n이 0이라면?                            <-- 여기서 변수라는 state가 없어서 했깔릴 수 있는데 이거 괄호로 뱉어진 나 자신 return 값을 의미함. 왜냐면 함수형 언어는 이 괄호 자체가 하나의 return 이라고 생각
      0                    ;(if일경우)0을 반환하고 끝냄 (종료 조건)
      (+ n (sum (- n 1)))));(else부분) 0이 아니라면? n + sum(n-1)을 계산함
(sum 10)
#|
public static int sum(int n) {
    int total = 0;
    for (int i = 1; i <= n; i++) {
        total += i;
    }
    return total;
}
이런 java 반복문의 경우 재귀로 만들면 위처럼 된다 total이란 변수도 없고 return 값에 자기 자신 넣으면 됨
when이나 if로 재귀 탈출 조건을 잘 세워주면 됨
|#


; 그리고 Racket에서는 반복문을 작성할 때 let에 이름을 붙여서(Named let) 재귀 호출을 하는 패턴을 매우 자주 사용

;어디까지 반복되는지는 알아야 할꺼 아니냐

;; 1부터 10까지 1씩 증가시키며 무언가 반복할 때
(let loop ([i 1])
  (when (<= i 10)
    (displayln i)
    (loop (add1 i)))) ; i를 1 증가시켜 다음 루프 진행