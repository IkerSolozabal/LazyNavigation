//
//  ContentViewModel.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

internal final class ContentViewModel: BaseViewModel<ContentViewState> {
    init() {
        super.init(viewState: ViewState(
            dataState: ContentViewState(
            )
        ))
    }

    func triggerEvent(event: ContentViewEvents) {
        switch event {
        case .navigate(let appView, let data, let action):
            self.navigate(destination: appView, setupData: data, action: action)
        }
    }
}
