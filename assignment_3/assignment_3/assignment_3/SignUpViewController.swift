//
//  SignUpViewController.swift
//  assignment_3
//
//  Created by Taijaun Pitt on 02/04/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var switchAgreement: UISwitch!
    @IBOutlet weak var labelAgreement: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = "Sign up now"
        textFieldUsername.placeholder = "E-mail"
        textFieldPassword.placeholder = "Password"
        switchAgreement.isOn = false
        labelAgreement.text = "I agree to the terms and conditions"
        buttonSignUp.setTitle("Sign up", for: .normal)

        
    }
    

}
