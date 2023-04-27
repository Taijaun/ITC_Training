//
//  PokemonViewModel.swift
//  ITC_Pokemon
//
//  Created by mohomed Ali on 25/04/2023.
//

import Foundation
import CoreData

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonDetails]()
    @Published var customisedError : NetworkingError?
    
    // initialize Nwetwork
    var manager: Networker
    
    init(manager: Networker) {
        self.manager = manager
    }
    
    func getListOfPokemons(urlString: String, context: NSManagedObjectContext) async{
        // convert URL string to URL
        guard let url = URL(string: urlString) else {
            customisedError = NetworkingError.invalidURL
            return
        }
        do {
            // initialize async await func to fetch data from Network Manager
            let data = try await self.manager.callApi(url: url)
            // decode the JSON from raw data
            let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
            self.pokemonList = pokemonData.data.map { pokemonEntity in
                PokemonDetails(name: pokemonEntity.name, artist: pokemonEntity.artist, rarity: pokemonEntity.rarity, images: pokemonEntity.images)
            }
            
            let coreDataManager = CoreDataManager(context: context)
            try await coreDataManager.saveDataToDatabase(list: self.pokemonList)
            
            
        }catch let error{
            if error as?  NetworkingError == .parsingError{
                customisedError = .parsingError
            } else {
                customisedError = .dataNotFound
            }
            print(error.localizedDescription)
            
            
            
        }
        
        
        
    }
}
