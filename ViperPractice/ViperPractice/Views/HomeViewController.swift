//
//  ViewController.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import UIKit

class HomeViewController: UIViewController, AnyView {
    let dummyData = ["50", "1000", "Monday", "Tuesday"]
    var productList: [Product] = []
    var presenter: AnyPresenter?
    
    func updateViewWithProductList(products: [Product]){
        // assign data to table etc
        productList = products
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("In ViewController")
    }
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstCellXib = UINib(nibName: "FirstTableViewCell", bundle: nil)
        tableView.register(firstCellXib, forCellReuseIdentifier: "FirstCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("hello")
    }


}



extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstTableViewCell else {return UITableViewCell()}
        cell.labelProductName.text = productList[indexPath.row].title
        
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailScreen()
    }
}

