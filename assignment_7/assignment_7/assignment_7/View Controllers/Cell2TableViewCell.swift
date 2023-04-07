//
//  Cell2TableViewCell.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit

class Cell2TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    @IBOutlet weak var labelFruitGenus: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func printDetailsTapped(_ sender: Any) {
        
        print("Hello")
        
    }
    
    
}
