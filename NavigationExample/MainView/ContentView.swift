//
//  ContentView.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    @State var path: [AppViews] = []
    var body: some View {
        NavigationStack(path: $path) {
            ForEach(AppViews.allCases) { view in
                NavigationLink("", value: view)
            }
            .navigationDestination(for: AppViews.self) { view in
                Spacer()
                Text(view.rawValue)
                    .navigationTitle(view.rawValue)
                Spacer()
                Button("Go to root") {
                    path = []
                }
                Spacer()
            }
            getRootView()
        }
        .navigationBarHidden(false)
        .navigationTitle("Roor View")
    }

    @ViewBuilder
    func getRootView() -> some View {
        VStack {}
        Spacer()
        Button("Go to park Yosemite") {
            path = [.Yosemite]
        }
        Spacer()
        Button("Go to park Sequoaia") {
            path = [.Sequoia, .Yosemite, .Secondary]
        }
        Spacer()
    }
}
