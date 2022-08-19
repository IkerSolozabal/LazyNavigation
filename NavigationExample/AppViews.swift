//
//  AppViews.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//
import SwiftUI

// MARK: - Navigation Component

public struct NavigationComponent {
    let action: NavigationAction?
    let destination: AppViews?
    let setupData: Any?
    let customView: AnyView?

    init(
        action: NavigationAction? = nil,
        destination: AppViews? = nil,
        setupData: Any? = nil,
        customView: AnyView? = nil
    ) {
        self.action = action
        self.destination = destination
        self.setupData = setupData
        self.customView = customView
    }

    @ViewBuilder
    public func makeDestination() -> some View {
        if let destination = self.destination {
            self.getAppView(viewName: destination, setupData: self.setupData)
        }
    }

    @ViewBuilder
    func getAppView(viewName: AppViews, setupData: Any? = nil) -> some View {
        switch viewName {
        case .Secondary:
            SecondaryView()
        }
    }
}

public class RootAppView: ObservableObject {
    @Published var rootViewName: AppViews
    @Published var setupData: Any?

    public init(rootViewName: AppViews, setupData: Any? = nil) {
        self.rootViewName = rootViewName
        self.setupData = setupData
    }
}

public enum NavigationAction {
    case fullScreen
    case sheet
    case back
}

// MARK: - Application Views

public enum AppViews {
    case Secondary
}
