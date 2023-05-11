//
//  MapView.swift
//  MapKitWithAPI
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import SwiftUI

struct MapView: View {
    
    
    var body: some View {
        VStack {
            
        }.onAppear{
            Task{
                await MapViewModel.shared.getUsersList(urlString:"https://jsonplaceholder.typicode.com/users")
            }
        }
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
}
