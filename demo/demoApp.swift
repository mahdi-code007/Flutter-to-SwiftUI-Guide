//
//  demoApp.swift
//  Flutter to SwiftUI Guide
//
//  Created and developed by Mahdi Abd El-Mageed on 09/07/2025.
//  Main app entry point with Arabic RTL support
//  Custom implementation for educational purposes
//

import SwiftUI

@main
struct demoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}
