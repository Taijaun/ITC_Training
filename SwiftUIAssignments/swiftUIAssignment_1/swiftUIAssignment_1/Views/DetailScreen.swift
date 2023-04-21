//
//  DetailScreen.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct DetailScreen: View {
    
    let email: String
    let password: String
    
    var body: some View {
        VStack{
            Text("E-mail: \(email)")
            Text("Password: \(password)")
        }
    }
    
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(email: "Hello@hello.com", password: "1231232")
    }
}
