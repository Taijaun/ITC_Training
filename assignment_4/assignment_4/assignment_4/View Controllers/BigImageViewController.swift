//
//  BigImageViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 05/04/2023.
//

import UIKit

class BigImageViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewBigImage: UIImageView!
    
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewBigImage.image = UIImage(systemName: imageName ?? "doc")
        
    }
  

}
