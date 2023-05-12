//
//  Router.swift
//  ViperPractice
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController & AnyView
protocol AnyRouter{
    var entryPoint: EntryPoint?{get}
    static func start() -> AnyRouter
    func goToDetailScreen()
}
