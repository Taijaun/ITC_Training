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
    @StateObject var pinManager = PinManager()
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: 0.08), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var region: Binding<MKCoordinateRegion>? {
        guard let currentLocation = locationManager.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: 0.08), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
        }
        return MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
    }
    
    
    var body: some View {
        NavigationStack{
            VStack {
                if let currentRegion = region {

                    let userLocation = City(name: "You", coordinate: locationManager.currentLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 51.5, longitude: 0.085))
                    
                    Button {
                        pinManager.annotations.append(userLocation)
                    } label: {
                        Text("Add user location")
                    }
                    
                    Map(coordinateRegion: currentRegion, annotationItems: pinManager.annotations){ pin in
                        //MapMarker(coordinate: $0.coordinate)
                        
                        MapAnnotation(coordinate: pin.coordinate) {
                            NavigationLink {
                                DetailsView(location: pin)
                            } label: {
                                CustomMapPin(title: pin.name)
                            }

                            
                        }
                    }
                }
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
