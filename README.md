FP-practice

Java의 stream().filter().map().toArray()처럼 “필요한 만큼만 소비”해야 한다는 점

Racket에서는 무한 스트림 전체를 stream->list로 바꾸면 끝나지 않으니까, 반드시 먼저 stream-take로 잘라서 봐야 한다.

```java
customers.stream()
         .filter(customer -> customer.isActive())
         .map(customer -> customer.getName())
         .toArray(count -> new String[count]);
```