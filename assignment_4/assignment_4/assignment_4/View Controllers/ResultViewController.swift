//
//  ResultViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 05/04/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    let imageArray = ["trash", "calendar", "doc", "link", "person", "person.fill"]
    let numberTitles = [1, 2, 3, 4, 5, 6]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self

        
    }
    
}

extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCollectionViewCell
        cell?.imageViewResultCell.image = UIImage(systemName: imageArray[indexPath.item])
        cell?.labelResultCell.text = "\(numberTitles[indexPath.item])"
        return cell!
    }
    
}

extension ResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Make a reference to the VC that data is being passed to
        let bigImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "BigImageViewController") as! BigImageViewController
        
        // set the properties for the bigImageView controller based on the info from the resultVC
        let imageName = imageArray[indexPath.item]
        bigImageViewController.imageName = imageName
        
        self.navigationController?.pushViewController(bigImageViewController, animated: true)
        
    }
    
}
