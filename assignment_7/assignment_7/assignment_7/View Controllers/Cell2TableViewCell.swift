//
//  Cell2TableViewCell.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit

protocol tableCellDelegate {
    func detailButtonClicked(index: Int)
}


class Cell2TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    @IBOutlet weak var labelFruitGenus: UILabel!
    
    var delegate: tableCellDelegate?
    var collectionClicked: (() -> Void)?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBAction func collectionTapped(_ sender: Any) {
        print("CollectionTapped")
        self.collectionClicked?()
    }
    
    
    @IBAction func detailViewTapped(_ sender: Any) {
        print("DetailTapped")
        delegate?.detailButtonClicked(index: self.tag)
    }
    
    
    
   
    
}
