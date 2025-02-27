//
//  NetworkManager.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import Foundation

class NetworkManager: NetworkAble {
    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        
        // get the url
        let url = URL(string: urlString)
        
        guard let url = url else { return }
        
        // Create a session Object
        let session = URLSession.shared
        
        // create data task
        let task = session.dataTask(with: url) { data, response, error in
            
            // Check for errors
            if let error = error {
                print(error.localizedDescription)
                handler(.failure(error))
                return
            }
            
            // Check response as a httpresponse
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Http error")
                return
            }
            
            // Make sure data has been downloaded
            guard let data = data else {
                print("Couldnt retrieve data from API")
                return
            }
            
            // Parse the data with JSON Decoder
            
            do {
                let fruits = try JSONDecoder().decode(type.self, from: data)
                // Pass the array
                handler(.success(fruits))
            } catch {
                print(error.localizedDescription)
                
            }
            
            
        }
        task.resume()
    }
    
    
}
