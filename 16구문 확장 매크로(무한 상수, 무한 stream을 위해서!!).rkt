#lang racket

;Java에는 없는 강력한 기능으로, 코드를 실행(평가)하기 전에 코드 자체를 변환하는 기능
;함수는 인자를 실행 시점에 먼저 “평가(Evaluate)”한 뒤에 값을 전달받지만,
;매크로는 코드를 텍스트 형태로 그대로 치환하므로 평가를 지연시키거나 새로운 문법 구조를 만들 수 있습니다.(지연연산!!)

(define-syntax-rule (my-delay expr)
  (lambda () expr))

; 만약 my-delay가 함수였다면 (displayln "Hi")가 즉시 실행되었겠지만, 
; 매크로이므로 (lambda () (displayln "Hi"))로 치환되어 실행이 지연됩니다.
(define delayed-print (my-delay (displayln "Hi"))) 
(delayed-print) ; 이때 비로소 "Hi"가 출력됨


;무한 스트림(Infinite Stream)을 만들 때, 뒤에 이어질 무한한 요소들을 즉시 계산하면 프로그램이 무한 루프에 빠지게 되므로, 이처럼 매크로를 사용하여 꼬리 부분의 계산을 지연시켜야 함