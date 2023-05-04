//
//  UserManager.swift
//  SingletonAndSubscriber
//
//  Created by Taijaun Pitt on 04/05/2023.
//

import Foundation

class UserManager {
    
    static let shared = UserManager()
    
    private init() {
        
    }
    
    var isLoggedin = false
    var username = ""
    var password = ""
    
    func userLogin(userEmail: String?, userPassword: String?) -> Bool {
        
        var validLogin = false
        
        // If fields are empty return false
        guard let userEmail = userEmail else {
            return validLogin
        }
        
        guard let userPassword = userPassword else {
            return validLogin
        }
        
        let isValidPassword = userPassword.count >= 8
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let isEmailValid = emailPredicate.evaluate(with: userEmail)
        
        
        validLogin = isValidPassword && isEmailValid
        
        if validLogin == true {
            self.isLoggedin = true
            self.username = userEmail
            self.password = userPassword
        }
        
        return validLogin
    }
    
    func userLogout() {
        
        self.isLoggedin = false
        
    }
    
    
}
