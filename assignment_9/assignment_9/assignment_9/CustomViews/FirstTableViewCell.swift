//
//  FirstTableViewCell.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    // Closure for button click handling
    var detailsClicked: (() -> Void)?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func showDetailsTapped(_ sender: Any) {
        // call the closure when the button is tapped
        self.detailsClicked?()
    }
    
    
}
