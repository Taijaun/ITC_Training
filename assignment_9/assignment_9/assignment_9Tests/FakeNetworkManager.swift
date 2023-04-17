//
//  FakeNetworkManager.swift
//  assignment_9Tests
//
//  Created by Taijaun Pitt on 17/04/2023.
//

import Foundation
@testable import assignment_9

class FakeNetworkManager: NetworkAble {
    
    
    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        
        
        // Faking
        guard let url = URL(string: urlString) else {return}
        let bundle = Bundle(for: FakeNetworkManager.self)

        let path = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let path = path else {return}

        do {
            let data = try Data(contentsOf: path)
            let fruitList = try JSONDecoder().decode(type, from: data)
            print(fruitList)
            handler(.success(fruitList))
        } catch {
            handler(.failure(error))
            print(error.localizedDescription)

        }
    }
    
    
    
    
}

class FakeNetworkManagerMocking: NetworkAble {

    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        
        //Mocking
        let mockArr = [Fruit(genus: "abc", name: "Apple", id: 1, family: "Apple Family", order: "Apple Order", nutritions: (Nutritions(carbohydrates: 1.0, protein: 5.0, fat: 4.0, calories: 2, sugar: 3.0))), Fruit(genus: "cba", name: "Pear", id: 2, family: "Pear Family", order: "Pear Order", nutritions: (Nutritions(carbohydrates: 2.0, protein: 3.0, fat: 4.0, calories: 5, sugar: 6.0)))]
        
        handler(.success(mockArr as! T))
        
        

    }
    
    
    
    
}

class FakeNetworkManagerStubbing: NetworkAble {
    // Stubbing
    var resultArr = [Fruit]()

    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        
        
        handler(.success(resultArr as! T))
        
        

    }
    
    
    
    
}
