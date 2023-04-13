//
//  DetailViewController.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    
    var fruit: Fruit?

    override func viewDidLoad() {
        super.viewDidLoad()

        labelFruitName.text = fruit?.name
        
    }
    

    

}
