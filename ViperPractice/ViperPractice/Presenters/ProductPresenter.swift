//
//  ProductPresenter.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation

class ProductPresenter: AnyPresenter {
    
    
    var view: AnyView?
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor?{
        didSet{
            Task{
                await interactor?.getProductList()
            }
        }
    }
    
    func getDataFromInteractor(product: Products) {
        view?.updateViewWithProductList(products: product.products)
    }
    
    func showDetailScreen() {
        router?.goToDetailScreen()
    }
    
}
