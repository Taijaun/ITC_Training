//
//  PlanetModel.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation

struct PlanetModel: Decodable{
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetResults]
}

struct PlanetResults: Decodable{
    let name: String
    let diameter: String
    let climate: String
    let terrain: String
    let population: String
}

struct PlanetResultsUI: Decodable, Identifiable {
    
    var id = UUID()
    let name: String
    let diameter: String
    let climate: String
    let terrain: String
    let population: String
    
}
