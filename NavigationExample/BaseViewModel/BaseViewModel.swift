//
//  BaseViewModel.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//


import SwiftUI
import WebKit

open class BaseViewModel<State: DataState>: NSObject, ObservableObject {
    @Published public var viewState: ViewState<State>
    @Published public var navigationComponent: NavigationComponent
    
    public init(viewState: ViewState<State>) {
        self.viewState = viewState
        self.navigationComponent = NavigationComponent(
            action: .back,
            destination: nil,
            setupData: nil,
            customView: nil
        )
    }
    
    public func shouldNavigate(action: NavigationAction) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.navigationComponent.action == action },
            set: { _ in self.previousView()  }
        )
    }
    
    public func navigate(destination: AppViews, setupData: Any? = nil, action: NavigationAction) {
        self.navigationComponent = NavigationComponent(
            action: action,
            destination: destination,
            setupData: setupData,
            customView: nil
        )
    }
    
    public func navigate(customView: AnyView, setupData: Any? = nil, action: NavigationAction) {
        self.navigationComponent = NavigationComponent(
            action: action,
            destination: nil,
            setupData: setupData,
            customView: customView
        )
    }
    
    func previousView() {
        self.navigationComponent = NavigationComponent(
            action: .back,
            destination: nil,
            setupData: nil,
            customView: nil
        )
    }
    
    public func showLoading() {
        DispatchQueue.main.async {
            self.viewState = self.viewState.showLoading()
        }
    }
    
    public func hideLoading() {
        DispatchQueue.main.async {
            self.viewState = self.viewState.hideLoading()
        }
    }
}

