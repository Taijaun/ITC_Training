//
//  swiftUIAssignment_1App.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

@main
struct swiftUIAssignment_1App: App {
    
    @StateObject var userDetails = Details()
    
    var body: some Scene {
        WindowGroup {
            CustomTabView().environmentObject(userDetails).onAppear{
                userDetails.email = "Test@gmail.com"
                userDetails.password = "testpassword"
            }
        }
    }
}
