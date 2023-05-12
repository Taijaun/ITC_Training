//
//  AnyPresenter.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation

protocol AnyPresenter{
    var view: AnyView? {get set}
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    
    func getDataFromInteractor(product: Products)
    func showDetailScreen()
}
