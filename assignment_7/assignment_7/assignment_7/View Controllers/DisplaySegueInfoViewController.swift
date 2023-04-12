//
//  DisplaySegueInfoViewController.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 12/04/2023.
//

import UIKit

class DisplaySegueInfoViewController: UIViewController {
    
    var receivedInfo = ""
    
    
    @IBOutlet weak var labelInfoReceived: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelInfoReceived.text = receivedInfo
    }
    


}
