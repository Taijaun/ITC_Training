//
//  CityModel.swift
//  SwiftUIMapKit
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation
import CoreLocation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
