//
//  Extensions.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import Foundation
import UIKit


// Create a cache
var imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    func loadImageFromURL(url: String, cell: UIImageView){

        if let image = imageCache.object(forKey: url as NSString) {
            cell.image = image
            return
        }
        
        guard let imageUrl = URL(string: url) else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
            if let image = UIImage(data: imageData){
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: url as NSString)
                    cell.image = image
                    
                }
            }
        }
    }
}
