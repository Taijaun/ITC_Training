//
//  ProductsRouter.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation
import UIKit

class ProductsRouter: AnyRouter{
    
    var entryPoint: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = ProductsRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        //VIP
        var view: AnyView = homeVC
        var interactor: AnyInteractor = Interacator()
        var presenter: AnyPresenter = ProductPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = homeVC as? EntryPoint
        
        return router
        
    }
    
    func goToDetailScreen() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        entryPoint?.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
}
