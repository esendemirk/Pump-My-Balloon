//
//  Navigate.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

// Navigate to game screen
func navigateToContentView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}

// Navigate to game screen
func navigateToStartView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: StartView())
        window.makeKeyAndVisible()
    }
}

// Navigate to score screen
func navigateToScoreView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ScoreView())
        window.makeKeyAndVisible()
    }
}

// Navigate to how to play screen
func navigateToHowToView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: HowToView())
        window.makeKeyAndVisible()
    }
}
