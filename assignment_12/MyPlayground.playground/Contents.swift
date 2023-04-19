import UIKit
import CoreFoundation

//Queues

//MARK: - GCD - grand central dispatch FIFO

// Main thread
DispatchQueue.main.async {
    
    // Update some UI
    print("Work completed on main thread")
    
}

DispatchQueue.main.asyncAfter(deadline: .now() + 7){
    
    print("Dispatch queue with a 7 second delay")
    
}
//// Global Queue
DispatchQueue.global(qos: .background).async {
    print("Global task started")
    for i in 1...4{
        print(i)
    }
    print("Global task ended")
}

DispatchQueue.global(qos: .background).async {
    print("2nd global task started")
    for i in 10...14{
        print(i)
    }
    
    print("2nd global task ended")
}



// Custom Queue
//let serialQueue = DispatchQueue(label: "com.tp.SerialQueue")
//
//serialQueue.async {
//    print("Task 1 started")
//    print("task 1 finished")
//}
//
//serialQueue.async {
//    print("Task 2 started")
//    print("Task 2 finished")
//}

// Concurrent Queue async & sync

let concurrentQueue = DispatchQueue(label: "com.tp.ConcurrentQueue",attributes: .concurrent)
    

concurrentQueue.async {
    print("task 3 started")
    for i in 10...14{
        print(i)
    }
    print("task 3 finished")
}

concurrentQueue.async {
    print("task 4 started")
    
    for i in 20...24{
        print(i)
    }
    
    print("task 4 finished")
    
}
