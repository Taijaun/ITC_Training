//
//  ViewController.swift
//  assignment2App
//
//  Created by Tai Pitt on 31/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelEnterDetails: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var tectFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = "ITC Training"
        labelEnterDetails.text = "Please enter your login details"
        
    }


}

