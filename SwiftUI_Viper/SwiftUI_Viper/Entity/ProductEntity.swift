//
//  ProductEntity.swift
//  SwiftUI_Viper
//
//  Created by Taijaun Pitt on 15/05/2023.
//

import Foundation

// MARK: - Welcome
struct Products: Decodable {
    let total, skip, limit: Int
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
