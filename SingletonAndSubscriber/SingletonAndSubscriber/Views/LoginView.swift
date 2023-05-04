//
//  ContentView.swift
//  SingletonAndSubscriber
//
//  Created by Taijaun Pitt on 04/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var titleText = "ITC"
    
//    let loginViewModel = LoginViewModel()
    @State var path = [Root]()
    
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
                
                Button {
                    if  UserManager.shared.userLogin(userEmail: userEmail, userPassword: userPassword){
                        print(UserManager.shared.username)
                        path.append(.homePage)
                        
                    }
                    
                    
                } label: {
                    Text("Login")
                }

                
                Spacer()
            }
            .padding()
            .padding(.top, 130)
            
            .navigationDestination(for: Root.self){ navigate in
                switch navigate {

                case .homePage:
                    HomePageView()
                case .details:
                    EmptyView()
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
    
//    func testSubscriber() {
//
//        let tester = Downloader()
//
//    }

    enum Root{
        case homePage
        case details
        case grid
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
