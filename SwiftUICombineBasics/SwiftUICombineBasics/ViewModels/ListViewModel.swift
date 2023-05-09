//
//  ListViewModel.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation
import Combine
class ListViewModel: ObservableObject{
    
    
    @Published var customError: NetworkError?
    var planetsList: [PlanetResultsUI] = []
    @Published var filteredPlanetsList: [PlanetResultsUI] = []
    private var cancelable = Set<AnyCancellable>()
    
    var manager: NetworkableProtocol
    
    init(manager: NetworkableProtocol) {
        self.manager = manager
    }
    
    func getPlanetList(apiUrl: String){
        guard let url = URL(string:apiUrl) else {return}
        self.manager.getPlanetsFromApi(url: url, type: PlanetModel.self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                    
                case .finished:
                    print("done")
                case .failure(let error):
                    switch error{
                        
                    case is URLError:
                        self.customError = .invalidURL
                    case is DecodingError:
                        self.customError = .parsingError
                    default:
                        self.customError = .dataNotFound
                    }
                    print(self.customError?.localizedDescription)
                }
            }receiveValue: { planetArr in
                print(planetArr)
                self.planetsList = planetArr.results.map{ planet in
                    PlanetResultsUI(name: planet.name, diameter: planet.diameter, climate: planet.climate, terrain: planet.terrain, population: planet.population)
                }
                self.filteredPlanetsList = self.planetsList.sorted(by: {$0.name < $1.name})
            }.store(in: &cancelable)
                
    }
    
    func filterPlanets(searchTerm: String){
        
        if searchTerm.isEmpty{
            self.filteredPlanetsList = self.planetsList
        } else {
            let filteredResult = self.planetsList.filter{ planet in
                return planet.name.localizedCaseInsensitiveContains(searchTerm)
            }
            self.filteredPlanetsList = filteredResult.sorted(by: {$0.name < $1.name})
        }
        
    }
    
    func cancelApiCall() {
        cancelable.first?.cancel()
    }
    
}
