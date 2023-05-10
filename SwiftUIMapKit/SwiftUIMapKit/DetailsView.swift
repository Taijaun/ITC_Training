//
//  DetailsView.swift
//  SwiftUIMapKit
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import SwiftUI
import CoreLocation

struct DetailsView: View {
    
    var location: City
    
    var body: some View {
        VStack{
            Text(location.name)
            Text("\(location.coordinate.latitude)")
            Text("\(location.coordinate.longitude)")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(location: City(name: "Test", coordinate: CLLocationCoordinate2D(latitude: 53.483959, longitude: -2.244644)))
    }
}
