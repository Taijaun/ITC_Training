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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
}

extension ShowDataViewController: UITableViewDataSource{
    
    // How many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return weekdays.count
        } else if section == 1 {
            return planets.count
        } else {
            return weather.count
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
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as? InfoTableViewCell
            cell?.imageViewPicture.image = UIImage(systemName: "square")
            cell?.labelName.text = weather[indexPath.row]
            return cell!
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
}

extension ShowDataViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! resultViewController
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}
