//
//  ContentView.swift
//  SwiftUIMapKit
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: 0.08), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var region: Binding<MKCoordinateRegion>? {
        guard let currentLocation = locationManager.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: 0.08), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
        }
        return MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
    }
    
    var body: some View {
        VStack {
            if let currentRegion = region {
                Map(coordinateRegion: currentRegion)
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
