//
//  ContentView.swift
//  FirebaseCrashlyticsDemo
//
//  Created by Taijaun Pitt on 03/05/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAnalytics

struct ContentView: View {
    
    var buttonTitle = "Tap for analytics"
    
    var body: some View {
        VStack {
            Button("Crash") {
              fatalError("Crash was triggered")
            }
            
            Button {
                genericGoogleAnalytics(title: buttonTitle)
            } label: {
                Text(buttonTitle)
            }

        }
        .padding()
    }
}


func genericGoogleAnalytics(title: String?) {
    Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
      AnalyticsParameterItemID: "id-\(title!)",
      AnalyticsParameterItemName: title!,
      AnalyticsParameterContentType: "cont",
    ])
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

