//
//  HomePageView.swift
//  UIkit_to_SwiftUI_Navigation
//
//  Created by Taijaun Pitt on 26/04/2023.
//

import SwiftUI

struct HomePageView: View {
    
    weak var navigationController: UINavigationController?
    
    var body: some View {
        VStack{
            Text("Welcome to SwiftUI").padding()
            
            
            Button{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let accountPageVC = storyboard.instantiateViewController(identifier: "AccountPageViewController")
                navigationController?.pushViewController(accountPageVC, animated: true)
                
            }label: {
                
                Text("Go to Account Page")
            }
        }
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
