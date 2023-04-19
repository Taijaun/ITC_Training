import UIKit
import CoreFoundation

//MARK: - Operation Queues

var randomArr = ["Hello", "World", "!", "abc", "123", "999"]

let firstOperation = BlockOperation {
    for i in 1...10 {
        print("First operation progress: \(i)")
    }
}

let secondOperation = BlockOperation {
    
    for i in randomArr {
        print(i)
    }
    
}

let customOperationQueue = OperationQueue()

// Determine how many operations can happen concurrently
//customOperationQueue.maxConcurrentOperationCount = 1

// Adding dependency to other operations
//secondOperation.addDependency(firstOperation)
customOperationQueue.addOperations([firstOperation, secondOperation], waitUntilFinished: true)

