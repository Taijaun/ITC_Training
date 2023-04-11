import UIKit

//Basic closures

var greeting =  {
    print("Hello world!")
}



greeting()

var greetingWithInput = { (name: String) in
    print("Hello \(name)")
}

// auto closure

greetingWithInput("Tai")


// Closure that returns a value
var squared = { (number: Int) in
    var numSquared = number * number
    return numSquared
}

print(squared(5))


// Closure as a parameter
func assignment7(learn: () ->() ) {
    print("fetch data from an API using protocol's and delegates")
    
    // Call the closure
    learn()
    
}

// Call the function and use a closure as the parameter
assignment7 {
    print("fetch data from an API using a closure")
}


// AutoClosures

func autoclosureTest(_ result: () -> Void ){
    
    print("Before")
    result()
    print("After")
    
}

autoclosureTest {
    print("Closure called")
}

func autoClosureTest2(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

autoClosureTest2(print("autoClosure"))
