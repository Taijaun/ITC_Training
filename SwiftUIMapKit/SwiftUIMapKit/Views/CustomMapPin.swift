//
//  CustomMapPin.swift
//  SwiftUIMapKit
//
//  Created by Taijaun Pitt on 10/05/2023.
//

import SwiftUI

struct CustomMapPin: View {
    var title: String
    
    var body: some View {
        VStack{
            
            Text(title)
                .font(.callout)
                .background(.white)
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption2)
                .foregroundColor(.blue)
                .offset(x: 0, y: -5)
            
        }
    }
}

struct CustomMapPin_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapPin(title:"Home")
    }
}
