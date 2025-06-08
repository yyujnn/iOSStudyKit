## RxSwift vs Combine

`RxSwift` 는 애플이 아닌 마이크로소프트가 제공하는 서드파티 라이브러리.  
`RxSwift` 와 거의 똑같은 기능을 제공하며 애플이 개발한 `Combine` 이라는 라이브러리가 있다.

**Combine** 
- `iOS 13` 이상부터 지원하는 라이브러리로, 비교적 출시된지 얼마안된 기술
- 따라서 아직 발전 중에 있는 기술이며, 관련 자료가 RxSwift 보다 적은 편

**RxSwift**
- ReactiveX 의 프로그래밍 철학을 따르기 때문에, 같은 철학을 따르는 `RxJava`, `RxPython`, `RxJS` 등 다른 언어를 사용하는 개발자들과 원활한 대화할 수 있다.
- 특히 안드로이드 개발자도 `RxJava` 로 안드로이드 앱 개발을 한다면, 중요한 로직등을 싱크를 맞춰서 함께 설계할 수 있다.

   <br>

## Observable
Observable 은 데이터가 흐르는 Stream 이다.  
Observable 에서 이벤트(값) 을 방출할 때는 상태를 함께 방출한다.

 - `onNext` : 정상적인 데이터 방출
 - `onError` : 에러 방출
 - `onCompleted` : 옵저버블의 종료 방출
   
   <br>

 기본적인 Observable 의 생성: Observable.create() 
 
<br>

## Single
옵저버블 중에서, 오직 하나의 값만을 방출하는 옵저버블

- `onSuccess`: 옵저버블의 onNext 와 동일
- `onFailure`: 옵저버블의 onError 와 동일

   <br>

## Subject
옵저버블 중에서 외부에서 값을 넣어줄 수 있는 옵저버블

- **`BehaviorSubject` : 초깃값이 있는 Subject. 구독시 가장 최근에 방출된 값을 받음.**

- **`PublishSubject` : 초깃값이 없는 Subject. 구독 이후로 방출된 값을 받음.**

🔗 [BehaviorSubject 🆚 BehaviorRelay](https://github.com/yyujnn/iOSStudyKit/issues/9)

🔗 [Subject 🆚 Relay](https://github.com/yyujnn/iOSStudyKit/issues/10)