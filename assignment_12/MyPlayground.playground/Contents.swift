import UIKit

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
    print("Global task ended")
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
    print("task 3 finished")
}

concurrentQueue.async {
    print("task 4 started")
    print("task 4 finished")
    
}
