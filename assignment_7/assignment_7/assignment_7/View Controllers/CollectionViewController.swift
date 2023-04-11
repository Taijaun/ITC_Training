//
//  CollectionViewController.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var fruitArr = [Fruit]()
    let networkManager = NetworkManager()
    
    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //networkManager.callApi()
        //networkManager.delegate = self
        
        getDataUsingClosure()
        

    }
    
    func getDataUsingClosure() {
        networkManager.getDataWithClosure { result in
            switch result {
                
            case .success(let fruits):
                
                self.fruitArr = fruits
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}


//MARK: - CollectionView delegate and data source methods

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitArr.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell1", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        cell.labelFruitName.text = fruitArr[indexPath.item].name
        return cell
        
    }
    
    
    
}


extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        let fruit = fruitArr[indexPath.item]
        detailsViewController.fruit = fruit
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    
}

extension CollectionViewController: NetworkResponseProtocol {
    
    // Get the parsed data array from network manager and display it
    func didFinishWithResponseArr(array: [Fruit]) {
        // get the array from the network manager and assign it to the array in the VC
        self.fruitArr = array
        // reload the table on the main thread once the data has been retrieved
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didReceiveError(error: Error) {
        print(error)
    }
    
}



