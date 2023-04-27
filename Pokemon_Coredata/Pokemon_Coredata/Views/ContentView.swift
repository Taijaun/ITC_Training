//
//  ContentView.swift
//  Pokemon_CoreData
//
//  Created by Taijaun Pitt on 27/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var pokemonViewModel: PokemonViewModel
    @State var path = [Root]()
    @State var errorOccured = false
    @Environment(\.managedObjectContext) private var viewContext

    
    
    // Create request that fetches data
    // collects all results
    var fetchRequest: NSFetchRequest<PokemonModelEntity> = PokemonModelEntity.fetchRequest()
    @FetchRequest(entity: PokemonModelEntity.entity(), sortDescriptors: [])
    var results: FetchedResults<PokemonModelEntity>


    var body: some View {
        
        
        
        NavigationStack(path: $path){
            
            VStack {
                if pokemonViewModel.customisedError != nil {
                    ProgressView().alert(isPresented: $errorOccured) {
                        Alert(title: Text("Error"), message: Text(pokemonViewModel.customisedError?.errorDesc ?? ""), dismissButton: .default(Text("Close")))
                    }
                } else {
                    List(results) { pokemon in
                        NavigationLink{
                            DetailsScreen(artist: pokemon.artist ?? "", rarity: pokemon.rarity ?? "", pokemonImage: pokemon.images?.large ?? "")
                        }label: {
                            HStack{
                                ListCell(thumbnail: pokemon.images?.small ?? "")
                            }
                        }
                        
                    }
                }
            }.refreshable {
                await pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint, context: viewContext)
                
                if pokemonViewModel.customisedError != nil {
                    errorOccured = true
                }
            }
            .task{
                
                await pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint, context: viewContext)
                
                // Print the db file path
                guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {return}
                
                let sqlitePath = url.appendingPathComponent("Pokemon_CoreData.sqlite")
                print(sqlitePath)
                
                if pokemonViewModel.customisedError != nil {
                    errorOccured = true
                }
            }
            
            
            .padding()
        }
        .navigationDestination(for: Root.self) { navigate in
            
            switch navigate {
            case .details:
                EmptyView()
            default:
                EmptyView()
            }
            
        }
    }
    
    enum Root{
        case details
    }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }


//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokemonViewModel: PokemonViewModel(manager: NetworkManager())).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
