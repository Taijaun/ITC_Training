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
    var imageUrl: String = "https://i.dummyjson.com/data/products/24/thumbnail.jpg"
    
    var body: some View {
        ZStack{
            
            AsyncImage(url:URL(string: imageUrl))
            
            VStack{
                Text("E-mail: \(email)")
                Text("Password: \(password)")
            }
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(email: "Hello@hello.com", password: "1231232")
    }
}
