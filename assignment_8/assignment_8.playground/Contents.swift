import UIKit

// Default initialiser

class DefaultInit{
    
    var randomInt = 30
    var randomString = "elrhugajg"
}

let randomObject = DefaultInit()

// Custom init

class School{
    var classes: Int
    var subjects: [String]
    var location: String
    var numOfTeachers: Int
    
    init(classes: Int, subjects: [String], location: String, numOfTeachers: Int) {
        self.classes = classes
        self.subjects = subjects
        self.location = location
        self.numOfTeachers = numOfTeachers
    }
}

let newSchool = School(classes: 5, subjects: ["English", "Geography"], location: "London", numOfTeachers: 24)

// Memberwise Initialiser

struct ApartmentBuilding {
    
    var numOfApartments: Int
    var numOfResidents: Int
    var buildingName: String
    
}

let newApartmentBuilding = ApartmentBuilding(numOfApartments: 37, numOfResidents: 5, buildingName: "RandomName")



// Required Initialiser

class Computer {
    var processor: String
    required init(processor: String) {
        self.processor = processor
    }
    
}

class DellComputer: Computer {
    
    
}


// Failable init

struct failableStruct {
    
    var age: Int
    
    init?(age: Int){
        if age < 18 {
            return nil
        }
        self.age = age
    }
}

