//
//  ResetPasswordViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 04/04/2023.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var labelInfo: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavBar setup
        self.navigationItem.title = "Reset Password"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        textFieldEmail.backgroundColor = .clear
        textFieldEmail.borderStyle = .none
        textFieldEmail.placeholder = "E-mail"
        
        buttonSend.setTitle("Send", for: .normal)
        
        labelInfo.text = "Enter your email and we will send you a password reset link"
    }
    

}
