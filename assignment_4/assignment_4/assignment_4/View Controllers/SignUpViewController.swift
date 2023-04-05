//
//  SignUpViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 04/04/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var labelAgreement: UILabel!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavBar setup
        self.navigationItem.title = "Sign Up"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // TextFields
        textFieldEmail.placeholder = "E-mail"
        textFieldEmail.backgroundColor = .clear
        textFieldEmail.borderStyle = .none
        
        textFieldPassword.placeholder = "Password"
        textFieldPassword.backgroundColor = .clear
        textFieldPassword.borderStyle = .none
        
        textFieldConfirmPassword.placeholder = "Confirm Password"
        textFieldConfirmPassword.backgroundColor = .clear
        textFieldConfirmPassword.borderStyle = .none
        
        
        labelAgreement.text = "By clicking sign up, you agree to the terms and conditions"
        buttonSignUp.setTitle("Sign Up", for: .normal)
        
        

        
    }
 

}
