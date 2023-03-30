import UIKit

class User {
    
    let firstName: String
    let userName: String?
    var password: String?
    var age: Int
    var isLoggedIn = false
    
    init(firstName: String, userName: String?, password: String?, age: Int) {
        self.firstName = firstName
        self.userName = userName
        self.password = password
        self.age = age
    }
    
    func ChangePassword(newPassword: String?){
        if let pass = newPassword{
            self.password = pass
        }
    }
    
    func logIn() {
        if isLoggedIn == false {
            isLoggedIn = true
        } else {
            return
        }
    }
    
    func logOut() {
        if isLoggedIn{
            isLoggedIn = false
        } else {
            return
        }
    }
    
    func getUserDetail() -> (String?, String?, String?, Int, Bool) {
        
        return (self.firstName, self.userName, self.password, self.age, self.isLoggedIn)
    }
    
}

struct Employee {
    var name: String
    var age: Int
    
    mutating func changeAge(newAge: Int) {
        
        self.age = newAge
    }
}

var userArray: [User] = []

var user1 = User(firstName: "Tai", userName: "taijaun123", password: "abc123", age: 26)
var user2 = User(firstName: "Norman", userName: "user1234", password: "password", age: 23)

userArray.append(user1)
userArray.append(user2)


for info in userArray{
    print("the users name is \(info.firstName)")
}
