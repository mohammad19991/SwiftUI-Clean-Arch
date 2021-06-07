//
//  AppState.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import Combine

class AppState: ObservableObject, Equatable {
    @Published var routing = ViewRouting()
    
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        lhs.routing == rhs.routing
    }
}

extension AppState {
    struct ViewRouting: Equatable {
        var contentView = ContentView.Routing()
    }
}
