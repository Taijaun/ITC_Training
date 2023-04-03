import Foundation

// protocols

protocol canDrive {
    
    var validLicense: Bool { get set }
    var validInsurance: Bool { get set }
    var hasCar: Bool { get set }
    
    func drive()
    
}

class Person: canDrive{
    
    var validLicense: Bool
    var validInsurance: Bool
    var hasCar: Bool
    
    init(validLicense: Bool, validInsurance: Bool, hasCar: Bool) {
        
        self.validLicense = validLicense
        self.validInsurance = validInsurance
        self.hasCar = hasCar
        
    }
    
    
    func drive() {
        
        if self.validLicense && self.validLicense && self.hasCar {
            print("The car starts up")
            
        }
    }
    
    
}

// Enums

// enum defaults
enum weatherType {
    
    case raining
    case sunny
    case windy
    case snowing
    case cloudy
    
}

// Enum associated value

enum holiday {
    
    case flying(destination: String)
    case stayingAt(hotel: String)
    case nightsAway(nights: Int)
    
}

// Enum methods
func getWeatherStatus(weather: weatherType){
    
    switch weather {
    case .raining:
        print("Bring an umbrella")
    case .sunny:
        print("It's sunny outside")
    case .windy:
        print("It's windy, bring a jacket")
    case .snowing:
        print("It's snowing outside")
    case .cloudy:
        print("It's cloudy outside, it might rain")
    }
    
}

getWeatherStatus(weather: .raining)
getWeatherStatus(weather: .cloudy)


// Enum raw value + computed property

enum Weekdays: Int, CaseIterable {
    
    case Monday = 1
    case Tuesday = 2
    case Wednesdays = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7
    
    var typeOfDay: String {
        switch self {
        case .Saturday, .Sunday:
            return "It's the weekend!"
        case .Monday, .Tuesday, .Wednesdays, .Thursday, .Friday:
            return "It's still a weekday."
        }
    }
}

// print the raw values for the enum
for numOfDays in Weekdays.allCases {
    print(numOfDays.rawValue)
}

func displayTypeOfDay(day: Weekdays){
    print(day.typeOfDay)
}
displayTypeOfDay(day: .Monday)



