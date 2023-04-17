//
//  NetworkableProtocol.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 17/04/2023.
//

import Foundation

protocol NetworkAble{
    
    func callApiWithClosure<T:Decodable>(urlString: String, type: T.Type, handler: @escaping (Result<T, Error>) -> Void)
    
}
