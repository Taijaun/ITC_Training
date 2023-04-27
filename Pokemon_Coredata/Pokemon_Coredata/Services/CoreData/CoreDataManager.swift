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
        deleteAll()
        
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
            
            entity.images = imageEntity
            
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
    
    // Remove entries from both tables one at a time
    private func deleteAll() {
        let (pokemonList, imageList) = getBothTables()
        
        pokemonList.forEach{ pokemon in
            context.delete(pokemon)
        }
        
        imageList.forEach{ pokemonImage in
            context.delete(pokemonImage)
            
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
    
    
    // Retrieve both tables
     func getBothTables() -> ([PokemonModelEntity], [PokemonCardImagesEntity]) {
        
        let pokemonListFetchRequest = PokemonModelEntity.fetchRequest()
        let pokemonImageFetchRequest = PokemonCardImagesEntity.fetchRequest()
        let mainList = (try? context.fetch(pokemonListFetchRequest)) ?? []
        let imageList = (try? context.fetch(pokemonImageFetchRequest)) ?? []
        
        return (mainList, imageList)
    }
    
    
    
}
