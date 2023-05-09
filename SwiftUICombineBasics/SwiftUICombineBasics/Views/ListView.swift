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
    
    @State private var selection = "Name"
    let filterBy = ["Name", "Terrain"]
    @StateObject var listViewModel = ListViewModel(manager: NetworkManager())
    @State var searchTerm : String = ""
    
    var body: some View {
        
        NavigationStack{
            VStack {
                
                Button {
                    //Function to cancel api call
                } label: {
                    Text("Cancel Request")
                }

                
                List(listViewModel.filteredPlanetsList) { planet in
                    NavigationLink{
                        DetailsView(planetDetails: planet)
                    }label: {
                        FirstSectionCell(planetName: planet.name, planetTerrain: planet.terrain)
                    }
                    
                }.scrollContentBackground(.hidden)
                
            }.padding(.bottom, 50)
        }.refreshable {
            listViewModel.getPlanetList(apiUrl: Endpoints.planetApi)
        } .onAppear {
            listViewModel.getPlanetList(apiUrl: Endpoints.planetApi)
        }
        .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchTerm) { term in
            listViewModel.filterPlanets(searchTerm: term)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
