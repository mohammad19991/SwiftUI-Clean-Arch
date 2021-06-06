//
//  ContentView.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @Environment(\.injected) var injected

    @State private var routingState = Routing()
    private var routingBinding: Binding<Routing> {
        $routingState.dispatched(to: injected.appState, \.routing.contentView)
    }
    var body: some View {
        print("Rendering Content View")
        return ZStack {
            Button(action: showDetails, label: {
                Text("Present Details Screen")
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .onReceive(routingUpdate) { routingState = $0 }
        .sheet(isPresented: routingBinding.showDetails, content: {
            DetailsView()
        })
    }
    
    private func showDetails() {
        injected.appState[\.routing.contentView.showDetails] = true
    }
}

extension ContentView {
    struct Routing: Equatable {
        var showDetails = false
    }

    fileprivate var routingUpdate: AnyPublisher<Routing, Never> {
        injected.appState.updates(for: \.routing.contentView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
