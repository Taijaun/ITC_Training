import UIKit
import CoreFoundation

//MARK: - Global Queues

// User interactive - milliseconds
DispatchQueue.global(qos: .userInteractive).async {
    print("**** UserInteractive Starting ****")
    print("UserInteractive: Used for animations and UI related tasks")
    print("UserInteractive: reload views")
    print("UserInteractive: Focus on responsiveness")
    print("**** UserInteractive Done ****")
}

// User Initiated - milliseconds or a few seconds
DispatchQueue.global(qos: .userInitiated).async {
    print("**** UserInitiated Starting ****")
    print("UserInitiated: For user generated actions")
    print("UserInitiated: API Pagination")
    print("UserInitiated: Scrolling table/collection views")
    print("UserInitiated: Things that are needed for the user to continue interacting with the app")
    print("**** UserInitiated Done ****")
}

// Utility - few seconds to a few minutes (downloading files/importing data) (progress bar etc)
DispatchQueue.global(qos: .utility).async {
    print("**** Utility Starting ****")
//    print("Utility: Downloading files")
//    print("Utility: Importing data")
//    print("Utility: Show a progress bar/some kind of animation to show progress of the operation")
//    print("Utility: Long ongoing tasks that don't need to be completed immediately")
    print("Downloading data")
    for i in 1...5{
        print("Download progress: \(i)")
    }
    print("Data downloaded")
    print("**** Utility Done ****")
}

// Background - anywhere from a few minutes to hours (backing up, indexing etc)
DispatchQueue.global(qos: .background).async {
    print("**** Background Starting ****")
    print("Background: backing up data")
    for i in 1...10{
        print("Back up progress: \(i)")
    }
    print("Background: back up complete")
    print("**** Background Done ****")
}

// Default
DispatchQueue.global(qos: .default).async {
    print("**** Default Starting ****")
    print("Default: Default priority")
    print("Default: Somewhere between userInteractive and utility depending on ongoing tasks")
    print("**** Default Done ****")
}

// Unspecified
DispatchQueue.global(qos: .unspecified).async {
    print("**** Unspecified Starting ****")
    print("Unspecified: Lowest priority")
    print("**** Unspecified Done ****")
}


