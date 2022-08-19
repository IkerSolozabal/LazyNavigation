//
//  ViewState.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//


public protocol DataState {}

public struct ViewState<State: DataState> {
    public let dataState: State
    public let loadingState: LoadingState
    
    public init(
        dataState: State,
        loadingState: LoadingState = .loaded
    ) {
        self.dataState = dataState
        self.loadingState = loadingState
    }
    
    private func copy(
        dataState: State? = nil,
        loadingState: LoadingState? = nil
    ) -> ViewState {
        ViewState(
            dataState: dataState ?? self.dataState,
            loadingState: loadingState ?? self.loadingState
        )
    }
    
    public func updateDataState(dataState: State) -> ViewState {
        self.copy(dataState: dataState)
    }
    
    public func showLoading() -> ViewState {
        self.copy(loadingState: .loading)
    }
    
    public func hideLoading() -> ViewState {
        self.copy(loadingState: .loaded)
    }
}

public enum LoadingState {
    case loading
    case loaded
}
