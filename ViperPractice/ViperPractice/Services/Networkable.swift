//
//  Networkable.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation

protocol Networkable{
    func callApi(url: URL) async throws -> Data
}
