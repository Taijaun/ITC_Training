//
//  Authentication.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 11/05/2023.
//

import Foundation

enum biometricType{
    case none
    case face
    case touch
}

enum AuthenticationError{
    case noFaceId
    case noTouchId
    case invalidCredentials
    case accessDenied
    case biometricError
}

extension AuthenticationError: LocalizedError, Identifiable{
    var id: String {
        self.localizedDescription
    }
    
    
    var errorDescription: String? {
        switch self{
            
        case .noFaceId:
            return NSLocalizedString("No Face Id has been set up", comment: "No Face ID")
        case .noTouchId:
            return NSLocalizedString("No Touch Id has been set up", comment: "No Touch ID")
        case .invalidCredentials:
            return NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials")
        case .accessDenied:
            return NSLocalizedString("Access denied", comment: "Access denied")
        case .biometricError:
            return NSLocalizedString("Biometric error", comment: "Biometric Error")
        }
    }
}
