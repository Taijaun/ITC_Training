//
//  InfoTableViewCell.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 04/04/2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageViewPicture: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
