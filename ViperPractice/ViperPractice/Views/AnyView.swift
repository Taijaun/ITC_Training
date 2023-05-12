//
//  AnyView.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func updateViewWithProductList(products: [Product])
    
}
