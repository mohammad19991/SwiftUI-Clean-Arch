//
//  ContentView.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var routingState = Routing()

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
        .sheet(isPresented: $routingState.showDetails, content: {
            DetailsView()
        })
    }

    private func showDetails() {
        routingState.showDetails = true
    }
}

extension ContentView {
    struct Routing: Equatable {
        var showDetails = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
