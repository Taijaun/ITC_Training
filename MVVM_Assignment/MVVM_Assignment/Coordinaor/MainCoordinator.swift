//
//  MainCoordinator.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 11/05/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.mainCoordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToTableView() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        tableVC.mainCoordinator = self
        navigationController.pushViewController(tableVC, animated: true)
    }
    
    func goToDetailScreen(product: Product) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        detailVC.product = product
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    
    
}
