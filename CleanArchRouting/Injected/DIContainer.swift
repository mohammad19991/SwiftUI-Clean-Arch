//
//  DIContainer.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import Combine
import SwiftUI

struct DIContainer: EnvironmentKey {
    let appState: Store<AppState>

    static var defaultValue: DIContainer { Self.default }
    private static let `default` = Self(appState: AppState())

    init(appState: Store<AppState>) {
        self.appState = appState
    }

    init(appState: AppState) {
        self.init(appState: Store<AppState>(appState))
    }
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}
