//
//  Users.swift
//  MapKitWithAPI
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation

struct Users: Decodable{
    
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    
}

struct Address:Decodable{
    var geo: Geo
}

struct Geo: Decodable{
    var lat: String
    var lon: String
}
