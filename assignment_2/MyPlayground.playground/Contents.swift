import UIKit

// Create a generic person class
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func speak(phrase: String){
        print(phrase)
    }
}

// Create a teacher class that inherits from Person
class Teacher: Person {
    var qualifiedSubjects = [String:Bool]()
    var isOnVacation = false
    
    func addQualifications(qualificationName: String){
        
        qualifiedSubjects[qualificationName] = true
        
    }
    
    func removeQualification(qualificationName: String){
        
        qualifiedSubjects[qualificationName] = nil
    }
    
    func changeVacationStatus() {
        
        if isOnVacation{
            isOnVacation = false
        } else {
            isOnVacation = true
        }
    }
    
    func getTeacherDetails() -> (String, Int, Bool) {
        
        return (self.name, self.age, self.isOnVacation)
    }
}

// create teacher/person objects
var person1 = Person(name: "Tai", age: 26)
var teacher1 = Teacher(name: "Bhushan", age: 25)

// Show that teacher inherits methods from person
person1.speak(phrase: "Greetings")
teacher1.speak(phrase: "Hello")

// Add data to the dictionary
teacher1.addQualifications(qualificationName: "English")
teacher1.addQualifications(qualificationName: "Biology")
print(teacher1.qualifiedSubjects)

// Remove data from the dictionary
teacher1.removeQualification(qualificationName: "English")
print(teacher1.qualifiedSubjects)

// Access data from a tuple
let teacher1Details = teacher1.getTeacherDetails()
print(teacher1Details.0)
