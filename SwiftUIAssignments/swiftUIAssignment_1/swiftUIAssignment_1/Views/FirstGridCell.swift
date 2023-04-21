//
//  FirstGridCell.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct FirstGridCell: View {
    let cellData: String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 15).fill(.brown).frame(width: 100, height: 100)
                .overlay(Text(cellData))
                
        }
    }
}

struct FirstGridCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstGridCell(cellData: "Grid cell")
    }
}
