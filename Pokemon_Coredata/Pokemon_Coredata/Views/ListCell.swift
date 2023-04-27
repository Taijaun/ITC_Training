//
//  ListCell.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import SwiftUI

struct ListCell: View {
    
    let thumbnail: String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: thumbnail))
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(thumbnail: "https://images.pokemontcg.io/pl1/1.png")
    }
}
