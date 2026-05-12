#lang racket

(define name "Alice")
(define age 20)
;함수형은 변수를 최소화하기 때문에 반드시 동적타입으로 가야 하는데, 반드시 return 값이 정확하게 추론되도록 너가 설계해야 한다 이건 아주 당연한 거임(타입추론)