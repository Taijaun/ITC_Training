//
//  NetworkManager.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import Foundation

class NetworkManager: Networker{
    
    func callApiWithClosure<T>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        

        let url = URL(string: urlString)
        guard let url = url else { return }
        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                handler(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Http error")
                return
            }
            
            guard let data = data else {
                print("Couldnt retrieve products data from API")
                return
            }
            
            
            do {
                let products = try JSONDecoder().decode(type.self, from: data)
                // Pass the array
                print(products)
                handler(.success(products))
            } catch {
                print(error.localizedDescription)
                
            }
            
            
        }
        task.resume()
    }
}
    
    
    
    
    
