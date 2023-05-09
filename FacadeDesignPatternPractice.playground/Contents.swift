import UIKit

enum Milks {
    case semiSkimmed
    case fullFat
    case oat
    case almond
    case none
}

enum Coffee {
    case black
    case espresso
    case mocha
    case latte
    case none
}

//enum temperature {
//    case hot
//    case iced
//}

enum Size {
    case large
    case medium
    case small
}

var milkDictionary = ["semi": 10, "full": 3, "oat": 8, "almond": 0]
var coffeeDictionary = ["black": 100, "espresso": 4, "mocha": 2, "latte": 0]

class CoffeeMachine {
    
    func createCoffee(coffee: Coffee, milk: Milks, size: Size){
        let milkController = MilkController()
        let coffeeController = CoffeeController()
        let sizeController = SizeController()
        
        guard let selectedCoffee = coffeeController.selectCoffee(typeOfCoffee: coffee) else {
            print("You cannot create this drink as the selected coffee is out of stock")
            return
        }
        
        guard let selectedMilk = milkController.selectMilk(typeOfMilk: milk) else {
            print("You cannot create this drink as the selected milk is out of stock")
            return
        }
        
        let drinkSize = sizeController.selectSize(chosenSize: size)
        
        print("Your drink is a \(drinkSize) \(selectedCoffee) with \(selectedMilk)")
        
        
    }
    
}


class MilkController{
    
    func selectMilk(typeOfMilk: Milks) -> String?{
        switch typeOfMilk {
            
        case .semiSkimmed:
            if milkDictionary["semi"] != 0 {
                return "semi-skimmed milk"
            } else {return nil}
            
        case .fullFat:
            if milkDictionary["full"] != 0 {
                return "full-fat milk"
            } else {return nil}
            
        case .oat:
            if milkDictionary["oat"] != 0 {
                return "oat milk"
            } else {return nil}
            
        case .almond:
            if milkDictionary["almost"] != 0 {
                return "almond milk"
            } else{return nil}
            
        case .none:
            return "no milk"
        }
    }
}

class CoffeeController {
    
    func selectCoffee(typeOfCoffee: Coffee) -> String? {
        
        switch typeOfCoffee {
            
        case .black:
            if coffeeDictionary["black"] != 0 {
                return "black coffee"
            } else {return nil}
            
        case .espresso:
            if coffeeDictionary["espresso"] != 0 {
                return "espresso"
            } else {return nil}
            
        case .mocha:
            if coffeeDictionary["mocha"] != 0 {
                return "mocha"
            } else {return nil}
            
        case .latte:
            if coffeeDictionary["latte"] != 0 {
                return "latte"
            } else {return nil}
            
        case .none:
            return "none"
        }
    }
}


class SizeController {
    
    func selectSize(chosenSize: Size) -> String {
        
        switch chosenSize {
            
        case .large:
            return "large"
        case .medium:
            return "medium"
        case .small:
            return "small"
        }
        
        
    }
}

let coffeeMachine = CoffeeMachine()

let myCoffeeChoice = Coffee.black
let myMilkChoice = Milks.oat
let sizeChoice = Size.medium

coffeeMachine.createCoffee(coffee: myCoffeeChoice, milk: myMilkChoice, size: sizeChoice)
