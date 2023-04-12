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
    
    @IBOutlet weak var textInfoSendToSegue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // pass info via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sendText = textInfoSendToSegue.text else {return}
        
        if segue.identifier == "StoryBoardSegue" {
            let segueVC = segue.destination as? DisplaySegueInfoViewController
            segueVC?.receivedInfo = sendText
        } else if segue.identifier == "2ndSegue" {
            let segue2VC = segue.destination as? DisplaySegueInfoViewController
            segue2VC?.receivedInfo = sendText
            }
        }
    
    
    
    @IBAction func tableViewTapped(_ sender: Any) {
        
        // Create a storyboard object
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(tableViewController, animated: true)
        
    }

    @IBAction func collectionViewTapped(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionVC = storyboard.instantiateViewController(identifier: "CollectionViewController")
        self.navigationController?.pushViewController(collectionVC, animated: true)
    }
    
    
    @IBAction func programmaticSegueTapped(_ sender: Any) {
        
        // perform the segue that wasnt directly connected through the button
        performSegue(withIdentifier: "2ndSegue", sender: sender)
    }
    
    

}

