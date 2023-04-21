//
//  ContentView.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    
    let loginViewModel = LoginViewModel()
    @State var path = [Root]()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                Text("ITC").padding()
                    .font(.system(size: 50))
                
                TextField("E-mail", text: $userEmail)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                SecureField("Password", text: $userPassword)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button{
                    if loginViewModel.isLoginValid(email: userEmail, password: userPassword){
                        print(userEmail)
                        print(userPassword)
                        
                        path.append(.list)
                    } else {
                        print("Invalid login")
                    }
                    
                }label: {
                    Text("Login")
                        .frame(width: 200, height: 30)
                }.buttonStyle(.borderedProminent)
                
                
                NavigationLink{
                    DetailScreen(email: userEmail, password: userPassword)
                }label: {
                    Text("Grid Screen")
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, 130)
            
            .navigationDestination(for: Root.self){ navigate in
                switch navigate {
                    
                case .list:
                    ListScreen()
                case .details:
                    DetailScreen(email: userEmail, password: userPassword)
                case .grid:
                    EmptyView()
                default:
                    EmptyView()
                    
                }
            }
            .navigationTitle(Text("First Screen"))
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        }
    enum Root{
        case list
        case details
        case grid
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userEmail: "Hello@gmail.com", userPassword: "12345678")
    }
}
