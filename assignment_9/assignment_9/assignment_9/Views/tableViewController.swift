//
//  tableViewController.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class tableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let tableViewModel = TableViewModel()
    
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
        
        tableViewModel.getDataWithClosure()
        

        
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
        return cell
        
        
    }
    
    
    
}
