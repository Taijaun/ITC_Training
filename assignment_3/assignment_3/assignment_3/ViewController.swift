//
//  ViewController.swift
//  assignment_3
//
//  Created by Taijaun Pitt on 02/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonLoginGmail: UIButton!
    @IBOutlet weak var buttonLoginFacebook: UIButton!
    @IBOutlet weak var labelOr: UILabel!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    @IBOutlet weak var buttonForgotPassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = "ITC"
        labelUsername.text = "Enter your email address:"
        textFieldUsername.placeholder = "example@gmail.com"
        labelPassword.text = "Enter your password:"
        textFieldPassword.placeholder = "min 9 characters"
        buttonForgotPassword.setTitle("Forgot Password?", for: .normal)
        
        buttonLogin.setTitle("Login", for: .normal)
        buttonLoginGmail.setTitle("Login with Google", for: .normal)
        buttonLoginFacebook.setTitle("Login with Facebook", for: .normal)
        
        labelOr.text = "Or"
        buttonSignUp.setTitle("Sign up", for: .normal)
        
        
        
        
    }
    
    @IBAction func buttonSignUpTapped(_ sender: Any) {
        
        // create an instance of the View Controller and cast it as the necesarry view controller type
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUpViewController
        // use the navigation controller ot push the specified VC to the screen
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func buttonForgotPassword(_ sender: Any) {
        
        let resetPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPassword") as! ResetPasswordViewController
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        
    }
    


}

