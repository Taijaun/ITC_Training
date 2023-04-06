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
    let image2Array = ["space", "option", "alt", "control"]
    let numberTitles = [1, 2, 3, 4, 5, 6]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self

        // height for header
        // title for header
        // view for header
    }
    
}

extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return imageArray.count
        } else {
            return image2Array.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCollectionViewCell
            cell?.imageViewResultCell.image = UIImage(systemName: imageArray[indexPath.item])
            cell?.labelResultCell.text = "\(numberTitles[indexPath.item])"
            return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCollectionViewCell
            cell?.imageViewResultCell.image = UIImage(systemName: image2Array[indexPath.item])
            cell?.labelResultCell.text = "\(numberTitles[indexPath.item])"
            return cell!
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
}

extension ResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Make a reference to the VC that data is being passed to
        let bigImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "BigImageViewController") as! BigImageViewController
        
        // set the properties for the bigImageView controller based on the info from the resultVC
        if indexPath.section == 0 {
            let imageName = imageArray[indexPath.item]
            bigImageViewController.imageName = imageName
        } else {
            let imageName = image2Array[indexPath.item]
            bigImageViewController.imageName = imageName
        }
        
        
        self.navigationController?.pushViewController(bigImageViewController, animated: true)
        
    }
    
}
