//
//  NetworkManager.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import Foundation

class NetworkManager {
    
    let urlString = "https://fruityvice.com/api/fruit/all"
    
    // Create a delegate property so that the VC can call the method
    var delegate: NetworkResponseProtocol?
    
    func callApi() {
        
        // Save the API endpoint as a string
        // assign it as the value of a URL Object
        let url = URL(string: self.urlString)
        // Unwrap the URL
        guard let url = url else {return}
        
        // URLSessionConfiguration
        // URLSession - this manages network requests and responses
        // URLSessionTask - fetches data from the api
        // URLSessionDelegate {protocol} (provides methods for updates/errors/background tasks)
        
        /*
         
            1. Data task - API Fetching
            2. Upload task - Uploading to server
            3. Download task - Download files from a server
         
         */
        
        // Create a URLSession
        let session = URLSession.shared
        
        // Get a data task to fetch data from the api
        let task = session.dataTask(with: url) { data, response, error in
            
            // If there is an error show it
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.didReceiveError(error: error)
                return
            }
            
            // Check status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                print("HTTP Error")
                return
            }
            
            // Check the downloaded data
            guard let data = data else{
                print("Couldn't get data from API")
                return
            }
            
            
            // Parse the data with JSONDecoder object
            do {
                let fruits = try JSONDecoder().decode([Fruit].self, from: data)
                // Pass the parsed data to the delegate (tableVC)
                self.delegate?.didFinishWithResponseArr(array: fruits)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        
        // (starts the task)
        task.resume()
    }
    
    
    func getDataWithClosure(handler: @escaping (Result<[Fruit], Error>) -> Void){

        let url = URL(string: self.urlString)
        guard let url = url else {return}
        
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // If there is an error show it
            if let error = error {
                print(error.localizedDescription)
                handler(.failure(error))
                return
            }
            
            // Check status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                print("HTTP Error")
                return
            }
            
            // Check the downloaded data
            guard let data = data else{
                print("Couldn't get data from API")
                return
            }
            
            
            // Parse the data with JSONDecoder object
            do {
                let fruits = try JSONDecoder().decode([Fruit].self, from: data)
                // Pass the parsed fruits array if successful
                handler(.success(fruits))
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        
        // (starts the task)
        task.resume()
        
    }
    
    
}


