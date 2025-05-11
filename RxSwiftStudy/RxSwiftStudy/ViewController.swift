//
//  ViewController.swift
//  RxSwiftStudy
//
//  Created by 정유진 on 5/10/25.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    // 구독 해제 위한 가방
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test5()
    }

    // MARK: - Observable
    func test() {
        // 옵져버블 생성
        let newObservable: Observable<String> = Observable.create { observer in
            // 순서대로 "Adam", "Eve", "Abel" 이라는 값을 방출하도록
            observer.onNext("Adam")
            observer.onNext("Eve")
            observer.onNext("Abel")
            
            // Disposables.create() 를 작성함으로써 옵저버블 생성 완료
            return Disposables.create()
        }
        
        // 구독
        newObservable.subscribe(onNext: { value in
            print("이름: \(value)")
        }).disposed(by: disposeBag) // observable 이 종료되었을 때 구독을 해제할 disposeBag
    }
    
    func test2() {
        // 1초마다 값을 방출하는 옵져버블
        let someObservable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).take(5)
        // --> 정수형 데이터 방출하는 옵져버블, 1초마다 방출, scheduler: 스레드 의미 / 메인 스레드에서 방출, 5번만 방출
        // RxSwift 다양한 연산자, 메서드 제공
        
        someObservable.subscribe(onNext: { value in
            print("방출된 값: \(value)")
        }, onCompleted: {
            print("Completed")
        }).disposed(by: disposeBag)
        
        print("Hello")
        // --> 비동기적 수행으로, Hello 먼저 찍히게 됨.
        // RxSwift 는 옵져버 패턴과 비동기 프로그래밍에 도움을 줄 수 있다 !
    }
    
    // MARK: - Single
    func test3() {
        // Single 생성
        let single = Single.create { observer in
            observer(.success("Adam"))
            return Disposables.create()
        }
        
        single.subscribe(onSuccess: { value in
            print(value)
        }).disposed(by: disposeBag)
    }
    
    // MARK: - BehaviorSubject
    func test4() {
        // BehaviorSubject 생성
        let subject = BehaviorSubject(value: 10)
        
        subject.subscribe(onNext: { value in
            print("값 방출: \(value)")
        }).disposed(by: disposeBag)
        
        // 외부에서 값 넣어줌
        subject.onNext(20)
        subject.onNext(30)
    }
    // MARK: - PublishSubject
    func test5() {
        // PublishSubject 생성
        let subject = PublishSubject<Int>()
        
        subject.subscribe(onNext: { value in
            print("값 방출: \(value)")
        }).disposed(by: disposeBag)
        
        subject.onNext(20)
        subject.onNext(30)
    }
    
}

