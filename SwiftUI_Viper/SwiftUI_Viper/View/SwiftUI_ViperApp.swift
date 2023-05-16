//
//  SwiftUI_ViperApp.swift
//  SwiftUI_Viper
//
//  Created by Taijaun Pitt on 15/05/2023.
//

import SwiftUI

@main
struct SwiftUI_ViperApp: App {
    var body: some Scene {
        WindowGroup {
            EntryPoint().environmentObject(Router())
        }
    }
}
