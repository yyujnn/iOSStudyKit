import Foundation

// SerialQueue + sync + async 예제 코드.

let serialQueue = DispatchQueue(label: "com.myapp.myqueue")
// --> Custom Queue 이며 Serial Queue

serialQueue.sync {
    print("Task 1 started")

    Thread.sleep(forTimeInterval: 2)
    
    print("Task 1 finished")
}

print("hello 1")

serialQueue.async {
    print("Task 2 started")
    
    Thread.sleep(forTimeInterval: 2)
    
    print("Task 2 finished")
}

print("hello 2")

serialQueue.async {
    print("Task 3 started")
    
    Thread.sleep(forTimeInterval: 2)
    
    print("Task 3 finished")
}

/*
 출력 결과 ☑️
 Task 1 started --> sync
 Task 1 finished
 hello 1
 Task 2 started --> async (비동기, 멈추지 않음)
 hello 2
 Task 2 finished
 Task 3 started
 Task 3 finished
 */

// ConcurrentQueue + sync + async

let concurrentQueue = DispatchQueue(label: "com.myapp.myqueue", attributes: .concurrent)

concurrentQueue.sync {
    print("Task 1 started")
    
    Thread.sleep(forTimeInterval: 5)
    
    print("Task 1 finished")
}

concurrentQueue.async {
    print("Task 2 started")
    
    Thread.sleep(forTimeInterval: 4)
    
    print("Task 2 finished")
}

concurrentQueue.async {
    print("Task 3 started")
    
    Thread.sleep(forTimeInterval: 3)
    
    print("Task 3 finished")
}
/*
 출력 결과 ☑️
 Task 1 started
 Task 1 finished
 Task 2 started
 Task 3 started
 Task 3 finished
 Task 2 finished
 */

concurrentQueue.sync {
    print("Task 1 started")
    Thread.sleep(forTimeInterval: 2)
    print("Task 1 finished")
}

concurrentQueue.async(qos: .background) {
    print("Task background started")
    Thread.sleep(forTimeInterval: 2)
    print("Task background finished")
}

concurrentQueue.async(qos: .userInteractive) {
    print("Task userInteractive started")
    Thread.sleep(forTimeInterval: 2)
    print("Task userInteractive finished")
}

concurrentQueue.async(qos: .utility) {
    print("Task utility started")
    Thread.sleep(forTimeInterval: 2)
    print("Task utility finished")
}

/*
 출력 결과 ☑️
 Task 1 started
 Task 1 finished
 Task userInteractive started
 Task utility started
 Task background started
 Task userInteractive finished
 Task background finished
 Task utility finished
 */
