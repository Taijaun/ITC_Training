//
//  CoreDataOperational.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import Foundation

protocol CoreDataOperationalProtocol {
    
    func saveDataToDatabase(list: [PokemonDetails]) async throws
    func getPokemonDataFromDatabase() async -> [PokemonModelEntity]
    
}
