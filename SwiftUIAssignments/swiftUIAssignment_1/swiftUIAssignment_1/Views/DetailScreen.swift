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
    
    @EnvironmentObject var details: Details
    
    var body: some View {
        ZStack{
            
            AsyncImage(url:URL(string: imageUrl))
            
            VStack{
                Text(email)
                Text("E-mail: \(details.email)")
                Text("Password: \(details.password)")
            }
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(email: "Hello@hello.com", password: "1231232")
    }
}
