# 📌 Observable → Driver로 전환하는 이유

RxSwift에서 UI와 바인딩할 때, 왜 `Observable` 대신 `Driver`를 사용하는 것이 좋을까?

---

## ✅ Driver란?

`Driver`는 RxCocoa에서 제공하는 **UI 바인딩에 특화된 Observable Wrapper**입니다. 다음과 같은 특징을 지닙니다:

| 특성 | 설명 |
|------|------|
| 🧵 **MainScheduler에서 실행** | UI 업데이트가 항상 안전하게 이루어집니다 |
| 🛡️ **Error를 방출하지 않음** | 스트림이 종료되지 않으며, 오류 발생 시 기본값 처리로 대체 |
| 🔁 **share(replay: 1)** 내장 | 여러 구독자에게 동일한 이벤트를 공유 (Hot Observable) |

---

## 🚫 Observable만으로 UI 바인딩 시 생길 수 있는 문제

| 문제점 | 설명 |
|--------|------|
| ❗ 쓰레드 미보장 | Observable은 어떤 스레드에서 동작할지 보장하지 않음 |
| ❗ onError 발생 시 스트림 종료 | UI 업데이트가 더 이상 이뤄지지 않을 수 있음 |
| ❗ 중복 구독 이슈 | 공유되지 않으면 Observable 실행이 반복될 수 있음 |

---

## ✅ Driver를 써야 하는 이유 요약

| 조건 | Driver 적합 여부 |
|------|----------------|
| UI 바인딩에 사용될 스트림 | ✅ |
| 메인 스레드에서 실행되어야 함 | ✅ |
| 오류 처리가 자동으로 되길 원함 | ✅ |
| 스트림 공유 및 중복 방지 필요 | ✅ |
| 네트워크 통신, 비UI 처리 | ❌ (→ Observable, Single 등 사용) |

---

## 🔁 Observable → Driver 변환 방법

```swift
let titleDriver = titleObservable
    .asDriver(onErrorJustReturn: "기본값")
