//
//  LocationManager.swift
//  SwiftUIMapKit
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

class LocationManager:NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentLocation: CLLocation?
    
    private var clLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.distanceFilter = kCLDistanceFilterNone
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        clLocationManager.requestWhenInUseAuthorization()
        clLocationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else{return}
        DispatchQueue.main.async {
            self.currentLocation = latestLocation
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        
    }
    
}

extension MKCoordinateRegion {
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
