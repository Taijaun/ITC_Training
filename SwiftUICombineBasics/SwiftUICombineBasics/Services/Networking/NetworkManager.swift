//
//  NetworkManager.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation
import Combine

class NetworkManager: NetworkableProtocol {

    
    
    func getPlanetsFromApi<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        
        //Publisher
        return URLSession.shared.dataTaskPublisher(for: url)
        //Operators
            //.map{$0.data}
            .tryMap({ (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse, 200...209 ~= httpResponse.statusCode else {
                    throw NetworkError.responseError
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError{ error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    
    
    
}
