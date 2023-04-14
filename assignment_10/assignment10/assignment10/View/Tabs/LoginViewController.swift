//
//  LoginViewController.swift
//  assignment10
//
//  Created by Taijaun Pitt on 14/04/2023.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpFeature", bundle: nil)
        guard let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
        
    }
    
    
}
