//
//  CoreDataManager.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataOperationalProtocol {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveDataToDatabase(list: [PokemonDetails]) async throws {
        // logic for saving with CoreData
        deleteAllFromDatabase()
        
        list.forEach{pokemon in
            
            let entity = PokemonModelEntity(context: context)
            entity.name = pokemon.name
            entity.artist = pokemon.artist
            entity.rarity = pokemon.rarity
            //entity.images?.large = pokemon.images?.large
            //entity.images?.small = pokemon.images?.small
            
            let imageEntity = PokemonCardImagesEntity(context: context)
            imageEntity.large = pokemon.images?.large
            imageEntity.small = pokemon.images?.small
            
        }
        do {
            try context.save()
            print("Data saved")
        }catch let error{
            print(error.localizedDescription)
            throw error
        }
        
        
    }
    
    private func deleteAllFromDatabase() {
        let dbList = getPokemonDataFromDatabase()
        
        dbList.forEach{ pokemon in
            context.delete(pokemon)
        }
        do {
            try context.save()
            print("Database cleared")
        } catch let error {
            print(error.localizedDescription)
            
        }
        
    }
    
    func getPokemonDataFromDatabase() -> [PokemonModelEntity] {
        let pokemonListFetchRequest = PokemonModelEntity.fetchRequest()
        let result = (try? context.fetch(pokemonListFetchRequest)) ?? []
        return result
    }
    
    
    
}
