//
//  AccountPageViewController.swift
//  UIkit_to_SwiftUI_Navigation
//
//  Created by Taijaun Pitt on 26/04/2023.
//

import UIKit

class AccountPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        UserDefaults.standard.setValue(nil, forKey: "isLoggedIn")
    }
    
    @IBAction func printButtonTapped(_ sender: Any) {
        guard let printedValue = UserDefaults.standard.value(forKey: "isLoggedIn") else {return}
        
        print("\(printedValue)")
    }
    
}
