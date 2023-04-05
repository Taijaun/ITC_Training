import UIKit

// set some arrays
var boardGames = ["Chess", "Checkers", "Monopoly", "Connect4", "Jenga"]
var randomNumbers = [1, 2, 88, 1782, 99, 55]
var i = 0


//MARK: - Loops

// for loop
for num in randomNumbers{
    print(num)
}

// while loop
while i < boardGames.count {
    
    print(boardGames[i])
    i+=1
}

i = 10

// repeat while loops
repeat {
    print("i is currently = \(i)")
    i+=1
} while i < 10



//MARK: - Extension

extension Int {
    
    func isEvenOrOdd() -> String {
        if self % 2 == 0 {
            return "\(self) is an even number"
        } else {
            return "\(self) is an odd number"
        }
    }
}

print(10.isEvenOrOdd())


//MARK: - Higher-order functions

// Sort
let ascendingNumbers = randomNumbers.sorted()
print(ascendingNumbers)

let descendingNumbers = randomNumbers.sorted { (a, b) -> Bool in
    return a > b
}
print(descendingNumbers)

// Map
let doubledArray = randomNumbers.map{$0 * 2}
print(doubledArray)

// Filter
let filteredNumbers = randomNumbers.filter{$0 > 55}
print(filteredNumbers)

// Reduce
let numbersReduced = randomNumbers.reduce(0) {$0 + $1}
print(numbersReduced)
