import Foundation

// 싱글톤 패턴으로 만든 클래스.
class Adam {
    
    // shared 를 통해서 싱글톤 접근.
    static let shared = Adam()
    var mbti = "ENTJ"
    var age = 26
    
    // ⭐️ 클래스 생성 자체를 막아버리기 위해 init 을 private 으로 선언.
    private init() {}
    
    func printInfo() {
        print("[Adam Info]")
        print("mbti = \(mbti)")
        print("age = \(age)")
    }
}


// shared 를 통해서 싱글톤 클래스 사용.
Adam.shared.printInfo()
// --> Adam 인스턴스
// shared 라는 공유 인스턴스 통해 접근

Adam.shared.mbti = "ISFP"
Adam.shared.age = 27

Adam.shared.printInfo()

