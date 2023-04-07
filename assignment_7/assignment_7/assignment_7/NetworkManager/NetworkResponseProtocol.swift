//
//  NetworkResponseProtocol.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import Foundation

protocol NetworkResponseProtocol{
    
    func didFinishWithResponseArr(array: [Fruit])
    func didReceiveError(error: Error)
    
    
}
