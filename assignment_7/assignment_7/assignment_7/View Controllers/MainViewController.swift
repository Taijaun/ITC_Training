//
//  MainViewController.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var buttonTableView: UIButton!
    
    @IBOutlet weak var buttonCollectionView: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func tableViewTapped(_ sender: Any) {
        
        // Create a storyboard object
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(tableViewController, animated: true)
        
    }
    
    @IBAction func collectionViewTapped(_ sender: Any) {
        
        // Create a storyboard object
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewController")
        self.navigationController?.pushViewController(collectionViewController, animated: true)
        
    }
    

}
