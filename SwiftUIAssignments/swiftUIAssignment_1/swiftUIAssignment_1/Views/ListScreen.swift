//
//  ListScreen.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct ListScreen: View {
    
    let greetings = ["Hello", "hi", "Bonjour", "Good Morning"]
    let farewells = ["Bye", "Cya", "later"]
    
    var body: some View {
        VStack{
            
            List(greetings, id: \.self){ greeting in
                
                FirstListCell(greeting: greeting)
                
            }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
