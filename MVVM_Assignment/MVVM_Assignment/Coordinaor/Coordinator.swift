//
//  Coordinator.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 11/05/2023.
//MVVMC UIKIT

import Foundation
import UIKit

protocol Coordinator{
    var childCoordinators: [Coordinator]{get}
    var navigationController: UINavigationController { get set }
    func startCoordinator()
}
