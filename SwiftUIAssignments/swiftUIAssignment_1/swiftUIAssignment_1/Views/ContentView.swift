//
//  ContentView.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 21/04/2023.
//

import SwiftUI

/*
 Property wrappers
 
 1. State - modifying the state of the UI (simple types string etc)
 2. StateObject - class types (viewmodel, networkmanager etc)
 3. Binding - (Dollar sign) pass data backwards
 4. ObservedObject
 5. EnvironmentObject
 6. Published
 7. Environment
 8. AppStorage
 */

struct ContentView: View {
    
    
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var titleText = "ITC"
    
    let loginViewModel = LoginViewModel()
    @State var path = [Root]()
    @State var isBindingScreenVisible = false
    @EnvironmentObject var details: Details
    
    var body: some View {
        NavigationStack(path: $path){
            
            VStack {
                Text(titleText).padding()
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
                        
                        details.email = userEmail
                        details.password = userPassword
                        
                        
                        path.append(.list)
                    } else {
                        print("Invalid login")
                    }
                    
                }label: {
                    Text("Login")
                        .frame(width: 200, height: 30)
                }.buttonStyle(.borderedProminent)
                
                
                NavigationLink{
                    GridScreen()
                }label: {
                    Text("Grid Screen")
                }
                
                Button{
                    print("Show binding example screen")
                    isBindingScreenVisible = true
                }label: {
                    Text("Binding Screen")
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
            .sheet(isPresented: $isBindingScreenVisible) {
                BindingView(isVisible: $isBindingScreenVisible, loginTitle: $titleText, userName: "", userPass: "")
            }
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
