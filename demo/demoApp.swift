//
//  demoApp.swift
//  demo
//
//  Created by Mahdi Abd El-Mageed on 09/07/2025.
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
