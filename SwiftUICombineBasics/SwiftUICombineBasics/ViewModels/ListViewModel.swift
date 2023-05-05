//
//  ListViewModel.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var planetsList: [PlanetResultsUI] = []
    
    func getPlanetList(apiUrl: String){
        
    }
    
}
