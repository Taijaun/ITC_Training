//
//  Router.swift
//  SwiftUI_Viper
//
//  Created by Taijaun Pitt on 15/05/2023.
//

import Foundation
import SwiftUI

@MainActor
class Coordinator: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    
    func goToDetailScreen(){
        navigationPath.append(MyPage.detailScreen)
    }
    func goToWebPageScreen(){
        navigationPath.append(MyPage.webPage)
    }
    func goToTestScreen(){
        navigationPath.append(MyPage.testScreen)
    }
    
    @ViewBuilder
    func getMyPage(page: MyPage) -> some View {
      
        switch page {
        case .detailScreen:
            EmptyView()
        case .webPage:
            EmptyView()
        case .testScreen:
            EmptyView()
        case .mainPage:
            EmptyView()
        default:
            EmptyView()
        }
    }
    
}

enum MyPage{
    case mainPage
    case webPage
    case detailScreen
    case testScreen
}
