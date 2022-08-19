//
//  AsyncContentView.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import Combine
import SwiftUI

public struct AsyncContentView<LoadingView: View, State: DataState>: View {
    @ObservedObject var source: BaseViewModel<State>
    var loadingView: LoadingView
    var content: AnyView

    public init(source: BaseViewModel<State>,
                loadingView: LoadingView,
                content: AnyView) {
        self.source = source
        self.loadingView = loadingView
        self.content = content
    }

    public var body: some View {
        let viewState = self.source.viewState
        ZStack {
            self.content
                .navigate(
                    isPresented: self.source.shouldNavigate(action: .fullScreen),
                    destination: self.source.navigationComponent.makeDestination
                )
                .sheet(
                    isPresented: self.source.shouldNavigate(action: .sheet),
                    content: self.source.navigationComponent.makeDestination
                )
            if viewState.loadingState == .loading {
                self.loadingView
                    .ignoresSafeArea(edges: .all)
            }
        }
    }
}
