//
//  Navigate.swift
//  Pump My Balloon
//
//  Created by Kaan Esendemir on 10/12/20.
//

import SwiftUI

// Navigate to home screen
func navigateToContentView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}
