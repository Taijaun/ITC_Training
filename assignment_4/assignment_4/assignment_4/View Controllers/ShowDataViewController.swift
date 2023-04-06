//
//  ShowDataViewController.swift
//  assignment_4
//
//  Created by Taijaun Pitt on 04/04/2023.
//

import UIKit

class ShowDataViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let planets = ["Earth", "Mars", "Jupiter", "Uranus", "Venus", "Saturn", "Mercury", "Neptune"]
    let weather = ["Sunny", "Raining", "Cloudy", "Snowing", "Windy"]
    var usersArr = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellXib1 = UINib(nibName: "ThirdSectionTableViewCell", bundle: nil)
        // tableview.register(nib, forcellreuseidentifier:)
        tableView.register(cellXib1, forCellReuseIdentifier: "ThirdSectionTableViewCell")
        let cellXib2 = UINib(nibName: "FourthSectionTableViewCell", bundle: nil)
        tableView.register(cellXib2, forCellReuseIdentifier: "cell4")
        
        readJsonFile()

    }
    
    // Function to parse the json data
    func readJsonFile() {
        
        // tell xcode which bundle the file is located in
        let bundle = Bundle(for: ShowDataViewController.self)
        //  specify the file name within the bundle
        let url = bundle.url(forResource: "peoples", withExtension: "json")
        guard let url = url else {return}
        
        
        do {
            // Get the data from the json file
            let data = try Data(contentsOf: url)
            // Create a JSONDecoder object and use the decode method
            let userList = try JSONDecoder().decode([User].self, from: data)
            // assign the decoded user list to the Userarray
            usersArr = userList
            print(userList)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}

extension ShowDataViewController: UITableViewDataSource{
    
    // How many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return weekdays.count
        } else if section == 1 {
            return planets.count
        } else if section == 2 {
            return weather.count
        } else {
            return usersArr.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? InfoTableViewCell
            cell?.imageViewPicture.image = UIImage(systemName: "calendar")
            cell?.labelName.text = weekdays[indexPath.row]
            return cell!
            
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? InfoTableViewCell
            cell?.imageViewPicture.image = UIImage(systemName: "star")
            cell?.labelName.text = planets[indexPath.row]
            return cell!
            
        } else if indexPath.section == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdSectionTableViewCell") as? ThirdSectionTableViewCell else {return UITableViewCell()}
            cell.imageViewCell.image = UIImage(systemName: "square")
            cell.labelCellTitle.text = weather[indexPath.row]
                return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell4") as? FourthSectionTableViewCell else {return UITableViewCell()}
            cell.firstnameLabel.text = usersArr[indexPath.row].firstName
            cell.idLabel.text = usersArr[indexPath.row].id
            cell.cellImageView.setImage(from: usersArr[indexPath.row].avatar!, cell: cell)
            return cell
        }
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
}

extension ShowDataViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}

// extension on UIImageView to set the image
extension UIImageView{
    
    func setImage(from url: String, cell: UITableViewCell) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imageView!.image = image
            }
        }
    }
}


// Edited this code to create set image function
// func setImage(from url: String) {
//guard let imageURL = URL(string: url) else { return }
//
//    // just not to cause a deadlock in UI!
//DispatchQueue.global().async {
//    guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//    let image = UIImage(data: imageData)
//    DispatchQueue.main.async {
//        self.imageView.image = image
//    }
//}
//}
