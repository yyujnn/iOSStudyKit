//
//  ViewController.swift
//  MemoryLeak
//
//  Created by 정유진 on 4/25/25.
//

import UIKit

class ClassA {
    var x: ClassB?
}

class ClassB {
    var x: ClassA?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    // 버튼 클릭 시 메모리 누수가 나도록 코드 작성
    @IBAction func buttonTapped(_ sender: Any) {
        let classA = ClassA()
        let classB = ClassB()
        
        // ClassA ↔ ClassB 가 서로를 순환 참조하도록 설정
        classA.x = classB
        classB.x = classA
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

