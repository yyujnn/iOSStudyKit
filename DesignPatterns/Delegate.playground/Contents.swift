import Foundation

// 바리스타 프로토콜.
// 이 프로토콜을 만족하는 클래스는 커피를 만드는 책임을 갖는다.
protocol Barista: AnyObject {
    
    func makeCoffee() -> String
}

// 커피숍 클래스.
class CoffeeShop {
    
    weak var delegate: Barista?
    
    init() {}
    
    func serveCoffee() {
        guard let coffee = delegate?.makeCoffee() else { return }
        print("주문하신 \(coffee) 나왔습니다.")
    }
}

let coffeeShop = CoffeeShop()

class Adam: Barista {
    func makeCoffee() -> String {
        "아이스 아메리카노"
    }
}

let adam = Adam()

coffeeShop.delegate = adam
coffeeShop.serveCoffee()

// 👩🏻‍💻 델리게이트 패턴의 특징
// 커피숍 입장에서는 구체적으로 어떤 클래스가 커피를 제공해줄지 상관 없다. (구체 타입 몰라도 됨.)
// 그저 Barista 프로토콜을 만족하는 누군가 대신 수행해주길 바라며 프로토콜 메서드 사용한다.
// 프로토콜로 타입을 지정했기 때문에, 수정에 용이한 구조가 된다. 커피를 다른 방식으로 만들고 싶어졌을때, 위임자만 교체하면 된다는 뜻.
// 커피숍 클래스 내부 코드의 수정이 필요하지 않다.

class Eve: Barista {
    func makeCoffee() -> String {
        "카페라떼"
    }
}
let eve = Eve()
coffeeShop.delegate = eve
coffeeShop.serveCoffee()

// 일반적인 개발론에서 이러한 이유로 클래스 타입보다는 프로토콜 타입에 의존을 하는 경우가 좋은 구조인 경우가 많다. --> 클래스: 구체적, 프로토콜: 추상적
// 이 철학은 객체지향 5대 원칙 중 의존성 역전 원칙(DIP)과 관련이 있다.


// 🧑🏻‍💻 UIKit 의 델리게이트 패턴 활용 예시

// UITableViewDelegate 의 tableView(_:heightForRowAt:) 메서드.
// “테이블 뷰 셀의 높이 설정하기” 라는 작업을 UIViewController 에서 `tableView.delegate = self` 라는 코드를 작성함으로써 내가 그 위임자가 되겠다고 선언.
// UIViewController가 UITableView의 delegate가 된다는 건, 테이블뷰에서 발생하는 특정 이벤트나 동작(예: 셀 높이, 셀 선택 등)을 대신 처리해주는 '대리자(delegate)'가 UIViewController라는 뜻
