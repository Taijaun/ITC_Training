//
//  tableViewController.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class tableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let tableViewModel = TableViewModel(manager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellXib = UINib(nibName: "FirstTableViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "cell1")
        tableView.dataSource = self
        
        tableViewModel.reloadView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableViewModel.getDataWithClosure(urlString: "https://fruityvice.com/api/fruit/all")
        

        
    }
    

    

}

// MARK: - tablevc delegate/datasource methods

extension tableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.fruitList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? FirstTableViewCell else {return UITableViewCell()}
        cell.labelFruitName.text = tableViewModel.fruitList[indexPath.row].name
        
        // Closure that handles the button click action
        cell.detailsClicked = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
            detailVC.fruit = self.tableViewModel.fruitList[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        return cell
        
        
    }
    
    
    
}
