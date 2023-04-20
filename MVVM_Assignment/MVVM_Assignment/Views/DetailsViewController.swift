//
//  DetailsViewController.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDiscount: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelStock: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    
    
    
    var product: Product?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsCollectionView.dataSource = self
        
        labelTitle.text = "\(product?.title ?? "")"
        labelDescription.text = "\(product?.description ?? "")"
        labelPrice.text = "£\(product?.price ?? 0)"
        labelDiscount.text = "Discount: \(product?.discountPercentage ?? 0)"
        labelRating.text = "Rating: \(product?.rating ?? 0)"
        labelStock.text = "Stock: \(product?.stock ?? 0)"
        labelBrand.text = "Brand: \(product?.brand ?? "")"
        labelCategory.text = "Category: \(product?.category ?? "")"
        
        

        // Do any additional setup after loading the view.
    }
    

    

}

extension DetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell1", for: indexPath) as? FirstCollectionViewCell else { return UICollectionViewCell() }
        
        cell.cellImageView.loadImageFromURL(url: product!.images[indexPath.item], cell: cell.cellImageView)
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let product = product else {return 0}
        return product.images.count
    }
    

    
    
    
}
