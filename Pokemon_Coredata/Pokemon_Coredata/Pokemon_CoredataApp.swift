//
//  Pokemon_CoreDataApp.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import SwiftUI

@main
struct Pokemon_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
