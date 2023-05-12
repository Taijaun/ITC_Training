//
//  FirstTableViewCell.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var labelProductName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
