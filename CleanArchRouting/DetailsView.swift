//
//  DetailsView.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        print("Rendering Details View")
        return Text("Details View")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
