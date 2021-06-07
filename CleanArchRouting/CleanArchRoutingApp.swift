//
//  CleanArchRoutingApp.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import SwiftUI

@main
struct CleanArchRoutingApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        print("Rendering CleanArchRoutingApp")
        return WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
