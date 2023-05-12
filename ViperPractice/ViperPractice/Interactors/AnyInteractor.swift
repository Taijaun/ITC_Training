//
//  AnyInteractor.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation

protocol AnyInteractor{
    var presenter: AnyPresenter? {get set}
    func getProductList() async
}

class Interacator: AnyInteractor{
    
    var presenter: AnyPresenter?
    
    func getProductList() async {
        // convert URL string to URL
        guard let url = URL(string: "https://dummyjson.com/product") else {
            return
        }
        do {
            let networkManager = NetworkManager()
            // initialize async await func to fetch data from Network Manager
            let data = try await networkManager.callApi(url: url)
            // decode the JSON from raw data
            let productData = try JSONDecoder().decode(Products.self, from: data)
            print(productData)
            presenter?.getDataFromInteractor(product: productData)
            
        }catch{
            print(error.localizedDescription)
            
            
            
        }
        
        
        
    }
    
    
}
