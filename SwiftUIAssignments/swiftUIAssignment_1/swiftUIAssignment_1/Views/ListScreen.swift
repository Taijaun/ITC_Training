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
    
    let sections = ["Greetings", "Farewells"]
    @EnvironmentObject var details : Details
    
    var body: some View {
        VStack{
            
            Text("\(details.email)")
            
            List {
                ForEach(sections, id: \.self){ section in
                    
                    Section(section){
                        if section == "Greetings" {
                            ForEach(greetings, id: \.self){ greeting in
                                
                                NavigationLink{
                                    DetailScreen(email: greeting, password: "World")
                                }label: {
                                    FirstListCell(title: greeting)
                                }
                            }
                        } else {
                            ForEach(farewells, id: \.self){ farewell in
                                
                                NavigationLink{
                                    DetailScreen(email: farewell, password: "World")
                                }label: {
                                    FirstListCell(title: farewell)
                                }
                                
                            }
                        }
                    }

                }
            }
            
            
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
