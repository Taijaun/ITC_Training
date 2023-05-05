//
//  FirstSectionCell.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import SwiftUI

struct FirstSectionCell: View {
    
    let planetName: String
    
    var body: some View {
        
        VStack {
            
            Text(planetName)
            
        }
    }
}

struct FirstSectionCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstSectionCell(planetName: "Earth")
    }
}
