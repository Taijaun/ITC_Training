//
//  TableViewController.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit



class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelFruitName: UILabel!
    @IBOutlet weak var labelFruitGenus: UILabel!
    
    let networkManager = NetworkManager()
    
    
    let dummyData = ["hello", "hi", "Hi2"]
    var fruitArr = [Fruit]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tableview delegate and datasource methods
        tableView.dataSource = self
        tableView.delegate = self

        // Register table view cell
        //let cellXib1 = UINib(nibName: "FirstTableViewCell", bundle: nil)
        //tableView.register(cellXib1, forCellReuseIdentifier: "cell1")
        
        // get the api data
        networkManager.callApi()
        networkManager.delegate = self
        
        
    }

    
    
    
    
    func readJson() {
        
        let bundle = Bundle(for: TableViewController.self)
        let url = bundle.url(forResource: "fileName", withExtension: "json")
        
        guard let url = url else {return}
        
        do {
            let data = try Data(contentsOf: url)
            let fruits = try JSONDecoder().decode([Fruit].self, from: data)
            fruitArr = fruits
            print(fruits)
            
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    
    
    
    
    
    
}


//MARK: - TableView delegate/datasource methods

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? Cell2TableViewCell else {return UITableViewCell()}
        cell.labelFruitName.text = "Name: \(fruitArr[indexPath.row].name)"
        cell.labelFruitGenus.text = "Genus: \(fruitArr[indexPath.row].genus)"
        
        // set the tag property to be able to navigate on click with protocol/delegate
        cell.delegate = self
        cell.tag = indexPath.row
        
        // Navigate with button click using closure
        cell.collectionClicked = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
            detailsVC.fruit = self.fruitArr[indexPath.row]
            print(detailsVC.fruit)
            self.navigationController?.pushViewController(detailsVC, animated: true)
            
        }
        return cell
        
    }
    
    
    
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        let fruit = fruitArr[indexPath.row]
        detailsViewController.fruit = fruit
        
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        
    }
    
    
}


//MARK: - Network protocol methods

extension TableViewController: NetworkResponseProtocol {
    
    // Get the parsed data array from network manager and display it
    func didFinishWithResponseArr(array: [Fruit]) {
        // get the array from the network manager and assign it to the array in the VC
        self.fruitArr = array
        // reload the table on the main thread once the data has been retrieved
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didReceiveError(error: Error) {
        print(error)
    }
    
}

//MARK: - button delegate methods

extension TableViewController: tableCellDelegate{
    // push to detailVC using Protocol/delegate to pass info
    func detailButtonClicked(index: Int) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        detailsVC.fruit = fruitArr[index]
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }

    
    // Navigate to collection view using closure
    func collectionButtonClicked() {
        
    }
    
    
    
    
    
    
    
}

