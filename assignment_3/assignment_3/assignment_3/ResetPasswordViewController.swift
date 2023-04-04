//
//  ResetPasswordViewController.swift
//  assignment_3
//
//  Created by Taijaun Pitt on 02/04/2023.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var labelHelpInfo: UILabel!
    @IBOutlet weak var buttonSend: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = "Reset password"
        textFieldEmail.placeholder = "E-mail"
        labelHelpInfo.text = "Enter your email and we will send you a password reset link"
        
        buttonSend.setTitle("Send", for: .normal)
        textFieldEmail.borderStyle = .none
    }
    


}
