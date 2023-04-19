//
//  TableViewModel.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import Foundation

class TableViewModel {
    
    let manager: Networker
    var productList = [Product]()
    
    var reloadTable: (() -> Void)?
    
    init(manager: Networker) {
        self.manager = manager
    }
    
    func getDataWithClosure(urlString: String) {
        manager.callApiWithClosure(urlString: urlString, type: Products.self) { result in
            
            switch result {
                
            case .success(let products):
                self.productList = products.products
                self.reloadTable?()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
        
    }
}
