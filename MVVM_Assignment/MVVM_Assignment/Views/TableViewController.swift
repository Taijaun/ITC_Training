//
//  TableViewController.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import UIKit

class TableViewController: UIViewController {
    
    var dummyArry = [1, 2, 3, 4, 5]
    
    let tableViewModel = TableViewModel(manager: NetworkManager())
    var mainCoordinator: MainCoordinator?
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.accessibilityIdentifier = "myTableView"
        
        let cellXib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "cell2")
        
        tableViewModel.reloadTable = {
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        tableViewModel.getDataWithClosure(urlString: "https://dummyjson.com/products")
        
    }
    

    

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! SecondTableViewCell
        let cellThumbnailUrl = tableViewModel.productList[indexPath.row].thumbnail
        
        cell.labelName.text = tableViewModel.productList[indexPath.row].title
        cell.cellImageView.loadImageFromURL(url: cellThumbnailUrl , cell: cell.cellImageView)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableViewModel.productList.count)
        return tableViewModel.productList.count
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        mainCoordinator?.goToDetailScreen(product: tableViewModel.productList[indexPath.row])
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
//        detailVC.product = tableViewModel.productList[indexPath.row]
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}


