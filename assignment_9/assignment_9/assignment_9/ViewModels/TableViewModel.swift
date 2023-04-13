//
//  TableViewModel.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import Foundation

class TableViewModel{
    
    let networkManager = NetworkManager()
    var fruitList = [Fruit]()
    var reloadView: (() -> Void)?
    
    func getDataWithClosure() {
        networkManager.callApiWithClosure { result in
            switch result {
                
            case .success(let fruits):
                self.fruitList = fruits
                self.reloadView?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
