//
//  FakeManager.swift
//  MVVM_AssignmentTests
//
//  Created by Taijaun Pitt on 20/04/2023.
//

import Foundation
@testable import MVVM_Assignment

class FakeManager: Networker {
    
    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        
        //Mocking
        let mockArr = Products(products: [Product(id: 5, title: "Hello", description: "abc1234", price: 1000, discountPercentage: 10.5, rating: 3.5, stock: 8, brand: "Apple", category: "Book", thumbnail: "hello@hello.com", images: ["H", "B", "C"])])
        
        handler(.success(mockArr as! T))
        
        

    }
    
    
    
}
