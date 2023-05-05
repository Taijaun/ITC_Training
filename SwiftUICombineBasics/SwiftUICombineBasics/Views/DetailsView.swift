//
//  DetailsView.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let planetDetails: PlanetResultsUI
    
    var body: some View {
        VStack{
            
            Text(planetDetails.name)
            Text(planetDetails.diameter)
            Text(planetDetails.population)
            Text(planetDetails.climate)
            
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(planetDetails: PlanetResultsUI(name: "Earth", diameter: "23413", climate: "Cold", terrain: "Mountains", population: "90000"))
    }
}
