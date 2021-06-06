//
//  AppState.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import Foundation

struct AppState: Equatable {
    var routing = ViewRouting()
}

extension AppState {
    struct ViewRouting: Equatable {
        var contentView = ContentView.Routing()
    }
}
