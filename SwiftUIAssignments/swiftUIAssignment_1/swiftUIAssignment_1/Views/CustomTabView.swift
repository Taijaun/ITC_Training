//
//  CustomTabView.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 23/04/2023.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView{
            
            ContentView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            ListScreen().tabItem {
                Image(systemName: "cloud")
                Text("List")
            }
            
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
