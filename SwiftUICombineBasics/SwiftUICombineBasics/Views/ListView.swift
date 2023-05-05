//
//  ContentView.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

/*
 Combine is geared towards Reactive Programming for UI
 
 Publisher/Subscriber Model
 1. Publisher - Sends the data
 2. Subscriber - Recieves the data
 3. Operator - type of publisher that processes the data and gives to subscriber (like a middleman)
 
 RxSwift
 RxCocoaTouch
 
 */

import SwiftUI
import Combine

struct ListView: View {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack {
                List(listViewModel.planetsList) { planet in
                    FirstSectionCell(planetName: planet.name, planetTerrain: planet.terrain)
                }
                
            }
            .padding()
        }.onAppear {
            listViewModel.getPlanetList(apiUrl: Endpoints.planetApi)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
