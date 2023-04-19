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
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("**** View Will Appear Started ***")
        print("The Login UI is about to appear")
        
        print("Prepare for animations that you want to trigger when UI Loads")
        print("Update UI with info that could have updated while this view was not shown on screen")
        print("*** View Will Appear Finished ***")
        
    }
    
    // This method is only ever called once
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("*** View Did Appear started ***")
        print("Start animation")
        print("Play some sound")
        print("Start a video")
        print("*** View Did Appear Ended")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("*** View Will Disappear Started ***")
        print("before transition to the next VC")
        print("*** View Will Disappear Finised ***")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("*** View Did Disappear Started ***")
        print("Stop tasks that shouldn't run while vc is not on screen")
        print("Stop listening to notifications for this VC's objects")
        print("Stop monitoring certain hardware that is only used on this VC")
        print("Stop network call that is not used anymore")
        print("*** View Did Disappear Started ***")
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if loginViewModel.isLoginValid(email: textFieldEmail.text, password: textFieldPassword.text){
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tableVC = storyboard.instantiateViewController(withIdentifier: "tableViewController")
            self.navigationController?.pushViewController(tableVC, animated: true)
        } 
    }
    

    

}
