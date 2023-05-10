//
//  MapViewModel.swift
//  MapKitWithAPI
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import Foundation

class MapViewModel: ObservableObject{
    @Published var userList = [Users]()
    
    var manager: Networkable
    
    init(manager: Networkable) {
        self.manager = manager
    }
    
    func getUsersList(urlString: String) async{
        
        guard let url = URL(string:urlString) else {return}
        
        
        do {
            // initialize async await func to fetch data from Network Manager
            let data = try await self.manager.callApi(url: url)
            // decode the JSON from raw data
            let userData = try JSONDecoder().decode(Users.self, from: data)
            self.userList = userData
            
            
        }catch let error{
            print(error.localizedDescription)
            
        }
    }
}
