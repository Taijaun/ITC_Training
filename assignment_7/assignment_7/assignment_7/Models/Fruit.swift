//
//  Fruit.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import Foundation

struct Fruit: Decodable {
    
    let genus: String
    let name: String
    let id: Int
    let family: String
    let order: String
    let nutritions: Nutritions
    
}

struct Nutritions: Decodable {
    
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Int
    let sugar: Double
}
