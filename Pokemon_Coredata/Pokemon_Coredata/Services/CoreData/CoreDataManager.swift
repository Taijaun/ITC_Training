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
        await deleteAll()
        
        try await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
            
            list.forEach{pokemon in
                
                let entity = PokemonModelEntity(context: privateContext)
                entity.name = pokemon.name
                entity.artist = pokemon.artist
                entity.rarity = pokemon.rarity
                //entity.images?.large = pokemon.images?.large
                //entity.images?.small = pokemon.images?.small
                
                let imageEntity = PokemonCardImagesEntity(context: privateContext)
                imageEntity.large = pokemon.images?.large
                imageEntity.small = pokemon.images?.small
                
                entity.images = imageEntity
                
            }
            do {
                try privateContext.save()
                print("Data saved")
            }catch let error{
                print(error.localizedDescription)
                throw error
            }
        }
        
        
        
        
    }
    
//    private func deleteAllFromDatabase() async {
//
//        await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
//
//            let dbList = self.getPokemonDataFromDatabase()
//
//            dbList.forEach{ pokemon in
//                privateContext.delete(pokemon)
//            }
//            do {
//                try privateContext.save()
//                print("Database cleared")
//            } catch let error {
//                print(error.localizedDescription)
//
//            }
//        }
//
//
//
//    }
    
    // Remove entries from both tables one at a time
    private func deleteAll() async {
        
        let (pokemonList, imageList) = await self.getBothTables()
        
        await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
            
            
            pokemonList.forEach{ pokemon in
                privateContext.delete(pokemon)
            }
            
            imageList.forEach{ pokemonImage in
                privateContext.delete(pokemonImage)
                
            }
            
            do {
                try privateContext.save()
                print("Database cleared")
            } catch let error {
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    
    func getPokemonDataFromDatabase() async -> [PokemonModelEntity] {
        await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
            
            let pokemonListFetchRequest = PokemonModelEntity.fetchRequest()
            let result = (try? privateContext.fetch(pokemonListFetchRequest)) ?? []
            return result
            
        }
        
    }
    
    
    // Retrieve both tables
    func getBothTables() async -> ([PokemonModelEntity], [PokemonCardImagesEntity]) {
         
        await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
             
             let pokemonListFetchRequest = PokemonModelEntity.fetchRequest()
             let pokemonImageFetchRequest = PokemonCardImagesEntity.fetchRequest()
             let mainList = (try? privateContext.fetch(pokemonListFetchRequest)) ?? []
             let imageList = (try? privateContext.fetch(pokemonImageFetchRequest)) ?? []
             
             return (mainList, imageList)
         }
        
        
    }
    
    
    
}
