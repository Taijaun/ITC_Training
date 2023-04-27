//
//  DetailsScreen.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    let artist: String
    let rarity: String
    let pokemonImage: String
    
    var body: some View {
        
        VStack{
            //AsyncImage(url: URL(string: pokemonImage))
            AsyncImage(url: URL(string: pokemonImage)) { Image in
                            Image.resizable().scaledToFit().padding()
                        } placeholder: {
                            ProgressView()
                        }
            Text("Artist: \(artist)")
            Text("Rarity: \(rarity)")
        }
    }
    
}


struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(artist: "Hello", rarity: "Rare", pokemonImage: "https://images.pokemontcg.io/pl1/1.png")
    }
}
