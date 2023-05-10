//
//  Networkable.swift
//  MapKitWithAPI
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation

protocol Networkable{
    func callApi(url: URL) async throws -> Data
}
