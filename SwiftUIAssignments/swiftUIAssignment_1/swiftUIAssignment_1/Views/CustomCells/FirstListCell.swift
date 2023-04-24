//
//  FirstListCell.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct FirstListCell: View {
    
    @EnvironmentObject var details: Details
    
    let title: String
    
    var body: some View {
        
        VStack{
            Text(title)
            HStack{
                Image(systemName: "cloud")
                Text("World")
            }
        }
    }
}

struct FirstListCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstListCell(title: "Cell Title")
    }
}
