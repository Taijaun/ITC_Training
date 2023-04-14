//
//  LoginViewController.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if loginViewModel.isLoginValid(email: textFieldEmail.text, password: textFieldPassword.text){
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tableVC = storyboard.instantiateViewController(withIdentifier: "tableViewController")
            self.navigationController?.pushViewController(tableVC, animated: true)
        } 
    }
    

    

}
