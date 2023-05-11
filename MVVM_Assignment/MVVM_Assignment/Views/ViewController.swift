//
//  ViewController.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var mainCoordinator: MainCoordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func navigateToTableTapped(_ sender: Any) {
        
        mainCoordinator?.goToTableView()
        
    }
    
    
}

