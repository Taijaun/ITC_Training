//
//  ContentView.swift
//  SwiftUI_Viper
//
//  Created by Taijaun Pitt on 15/05/2023.
//

import SwiftUI

struct EntryPoint: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
            NavigationStack(path: $router.navigationPath){
                router.getMyPage(page: .mainPage)
                .navigationDestination(for: MyPage.self) { navigation in
                    router.getMyPage(page: navigation)
                }
            }
        }
    }

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint().environmentObject(Router())
    }
}
