//
//  NetworkManager.swift
//  MapKitWithAPI
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation

class NetworkManager: Networkable {
    
    func callApi(url: URL) async throws -> Data {
        
        // Structured concurrency
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch let error{
            throw error
        }
        
    }
    
    
    
}
