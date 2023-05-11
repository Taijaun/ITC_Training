//
//  FirstTableViewCell.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
