//
//  TableViewModel.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import Foundation

class TableViewModel{
    
    let manager: NetworkAble
    var fruitList = [Fruit]()
    var reloadView: (() -> Void)?
    
    init(manager: NetworkAble) {
        self.manager = manager
    }
    
    func getDataWithClosure(urlString: String) {
        manager.callApiWithClosure(urlString: urlString, type: [Fruit].self ) { result in
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
