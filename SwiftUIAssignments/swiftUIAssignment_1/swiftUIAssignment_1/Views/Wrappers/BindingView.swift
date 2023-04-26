//
//  BindingView.swift
//  swiftUIAssignment_1
//
//  Created by Taijaun Pitt on 24/04/2023.
//

import SwiftUI

// Sending data backwards to login screen

struct BindingView: View {
    @Binding var isVisible: Bool
    @Binding var loginTitle: String
    
    @Binding var userName: String
    @Binding var userPass: String
    
    var body: some View {
        VStack{
            
            Text(loginTitle)
            
            Text("Binding example")
                .padding(.bottom, 50)
            
            Text("Info to pass to details screen")
            
            TextField("Email", text: $userName)
            TextField("Password", text: $userPass)
            
            
            Button {
                isVisible = false
                // Send this text back 
                loginTitle = "Binding was Clicked"
            } label: {
                Text("Dismiss")
            }

            
        }
    }
    
    struct BindingView_Previews: PreviewProvider {
        static var previews: some View {
            BindingView(isVisible: .constant(true), loginTitle: .constant("Title"), userName: .constant("12345"), userPass: .constant("Hello"))
        }
    }
}
