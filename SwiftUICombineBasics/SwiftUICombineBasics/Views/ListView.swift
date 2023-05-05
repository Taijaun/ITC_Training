//
//  ContentView.swift
//  SwiftUICombineBasics
//
//  Created by Taijaun Pitt on 05/05/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
