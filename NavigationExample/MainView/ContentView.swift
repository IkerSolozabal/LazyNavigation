//
//  ContentView.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    var body: some View {
        RadNavigationView {
            getContentView()
                .navigationBarHidden(true)
                .ignoresSafeArea(.all)
        }
    }

    func getContentView() -> some View {
        AsyncContentView(
            source: self.viewModel,
            loadingView: Text("loading..."),
            content: AnyView(
                VStack {
                    Text("Main View")
                    Button("Go to Example screen", action: {
                        showExampleScreen()
                    })
                }
            )
        )
    }

    func showExampleScreen() {
        self.viewModel.triggerEvent(
            event: .navigate(
                appView: .Secondary,
                setupData: nil,
                presentation: .fullScreen
            )
        )
    }
}
