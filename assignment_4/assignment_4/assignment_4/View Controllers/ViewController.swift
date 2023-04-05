//
//  ViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 04/04/2023.
//
// Assignment 5 Update

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var labelOr: UILabel!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonGoogle: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavBar setup
        self.navigationItem.title = "Sign in"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // First section setup
        textFieldEmail.backgroundColor = .clear
        textFieldEmail.borderStyle = .none
        textFieldEmail.placeholder = "E-mail"
        
        textFieldPassword.backgroundColor = .clear
        textFieldPassword.borderStyle = .none
        textFieldPassword.placeholder = "Password"
        
        buttonSignIn.setTitle("Sign in", for: .normal)
        
        buttonForgotPassword.setTitle("Forgot your password?", for: .normal)
        
        // Second section setup
        labelOr.text = "Or"
        labelOr.textAlignment = .center
        
        buttonFacebook.setTitle("Sign in with Facebook", for: .normal)
        //buttonFacebook.layer.cornerRadius = 1.0
        //buttonFacebook.layer.borderColor = UIColor.red.cgColor
        buttonGoogle.setTitle("Sign in with Google", for: .normal)
        
        labelQuestion.text = "Don't have an account yet?"
        buttonSignUp.setTitle("Sign Up", for: .normal)
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Create a reference to the storyboard file
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // Instantiate the View controller with the selected storyboard id
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController")
        // Use the nav controller to push the view to the screen
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        // Create an instance of the selected view controller and cast it
        let resetPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        //ShowDataViewController
        
        let resetPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataViewController") as! ShowDataViewController
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
    }
    
    


}


