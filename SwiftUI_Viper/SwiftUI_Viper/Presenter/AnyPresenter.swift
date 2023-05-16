//
//  AnyPresenter.swift
//  SwiftUI_Viper
//
//  Created by Taijaun Pitt on 16/05/2023.
//

import Foundation

protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
}
