//
//  NetworkingProtocol.swift
//  MVVM_Assignment
//
//  Created by Taijaun Pitt on 19/04/2023.
//

import Foundation

protocol Networker {
    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void)
    
}
