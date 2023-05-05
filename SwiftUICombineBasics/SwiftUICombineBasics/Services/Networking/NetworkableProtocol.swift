//
//  NetworkableProtocol.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation
import Combine

protocol NetworkableProtocol {
    
    func getPlanetsFromApi<T:Decodable>(url: URL, type: T.Type) -> AnyPublisher<T, Error>
    
}
