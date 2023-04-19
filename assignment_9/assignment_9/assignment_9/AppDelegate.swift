//
//  AppDelegate.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // App LifeCycle/States
    /*
     1. Not Running: - Not running
     2. Inactive: - Running in the foreground but not receiving events like taps, when a call is received the app becomes inactive
     3. Active: App is running in the foreground and receiving events
     4. Background: Running the in the background instead of foreground but still executing some logic like playing music
     5. Suspended: App is running in the background but not executing any logic
     
     
     */


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Will Finish Launching With Options Started")
        print("State restoration not started yet")
        print("Will Finish Launching With Options finished")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("Did Finish Launching With Options Started")
        print("Restore app state if needed, no UI yet")
        print("Did Finish Launching With Options finished")
        return true
    }

    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Application Will Terminate started")
        print("Do some logic")
        print("Application will terminate finished")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

