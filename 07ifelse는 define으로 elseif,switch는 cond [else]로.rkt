#lang racket
#|
int score = 85;
String result;
if (score >= 80) {
    result = "Pass";
} else {
    result = "Fail";
}
if else는 다음과 같이 하면 됨
|#
(define score 85)
(define result
  (if (>= score 80)
      "Pass"
      "Fail"))


;racket에서는 cond로 else if나 switch문 구현할 수 있음
#|
int n = 0;
if (n > 0) {
    System.out.println("Positive");
} else if (n < 0) {
    System.out.println("Negative");
} else {
    System.out.println("Zero");
}
if else는 다음과 같이 하면 됨
|#
(define n 0)
(cond
  [(> n 0) (displayln "Positive")]
  [(< n 0) (displayln "Negative")]
  [else (displayln "Zero")])

;“cond” 내부의 각 조건은 대괄호 “[]”로 묶는 것이 관례이며, 마지막에는 “else”를 사용