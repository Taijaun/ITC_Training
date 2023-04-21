//
//  LoginViewModel.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import Foundation

class LoginViewModel {
    
    
    func isLoginValid(email: String?, password: String?) -> Bool{
        
        var validLogin = false
        
        // If fields are empty return false
        guard let email = email else {
            return validLogin
        }
        
        guard let password = password else {
            return validLogin
        }
        
        let isValidPassword = password.count >= 8
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        validLogin = isValidPassword && isEmailValid
        
        return validLogin
        
    }
    
        
}
