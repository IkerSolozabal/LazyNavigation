//
//  ContentViewState.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

internal struct ContentViewState: DataState {
    internal func copy(
    ) -> ContentViewState {
        ContentViewState(
        )
    }
}

internal enum ContentViewEvents {
    case navigate(appView: AppViews, setupData: Any?, presentation: NavigationAction)
}
