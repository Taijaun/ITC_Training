//
//  LoginViewModel.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import Foundation
import LocalAuthentication

class LoginViewModel: ObservableObject {
    
    @Published var credentials = Credentials()
    @Published var authenticationError: AuthenticationError?
    
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
    
    func checkBiometricType() -> biometricType {
        
        let authContext = LAContext()
        let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        switch authContext.biometryType{
            
        case .none:
            return .none
        case .touchID:
            return .touch
        case .faceID:
            return .face
        @unknown default:
            return .none
        }
    }
    
    func authenticateUser(email:String, password: String, completion: @escaping (Result<Credentials, AuthenticationError>) -> ()){
        let credentials = Credentials(email: email, password: password)
        
        let authContext = LAContext()
        var error: NSError?
        let canEval = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if let error = error {
            switch error.code{
                
            case -6:
                completion(.failure(.accessDenied))
            case -7:
                if authContext.biometryType == .faceID{
                    completion(.failure(.noFaceId))
                } else {
                    completion(.failure(.noTouchId))
                }
                
            default:
                completion(.failure(.biometricError))
            }
        }
        if canEval{
            if authContext.biometryType != .none{
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Need to access Keychain") { success, error in
                    
                    if error != nil {
                        completion(.failure(.biometricError))
                    } else {
                        completion(.success(credentials))
                    }
                }
            }
        }
        
    }
    
        
}
