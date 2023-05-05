//
//  FirstSectionCell.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import SwiftUI

struct FirstSectionCell: View {
    
    let planetName: String
    let planetTerrain: String
    
    var body: some View {
        
        VStack {
            
            Text(planetName)
            Text(planetTerrain)
            
        }
    }
}

struct FirstSectionCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstSectionCell(planetName: "Earth", planetTerrain: "Desert")
    }
}
