//
//  GridScreen.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct GridScreen: View {
    
    let transport = ["Car", "bike", "Bicycle", "walk", "Plane", "Boat"]
    let gridColumns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        ScrollView{
            VStack{
                LazyVGrid(columns: gridColumns) {
                    
                    ForEach(transport, id: \.self){ transport in
                        FirstGridCell(cellData: transport)
                    }
                }
            }
        }.padding()
            .padding(.top, 150)
    }
    
    struct GridScreen_Previews: PreviewProvider {
        static var previews: some View {
            GridScreen()
        }
    }
}
