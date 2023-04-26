//
//  ViewController.swift
//  UIkit_to_SwiftUI_Navigation
//
//  Created by Taijaun Pitt on 26/04/2023.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    let loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        if loginViewModel.isLoginValid(email: textFieldEmail.text, password: textFieldPassword.text) {
            
            // Save the users logged in status
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            
            let homePageView = UIHostingController(rootView: HomePageView(navigationController: self.navigationController))
            
            navigationController?.pushViewController(homePageView, animated: true)
            
        }
        
        
    }
    

}

