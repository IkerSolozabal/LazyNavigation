//
//  ParkView.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 22/8/22.
//

import SwiftUI

struct ParkView: View {
    @State private var parks: [Park] = [Park(name: "Yosemite", view: .Yosemite), Park(name: "Sequoia", view: .Sequoia)]
    @State private var selection: Park? = nil
    var body: some View {
        NavigationSplitView {
            List(parks, selection: $selection) { park in
                NavigationLink(park.name, value: park)
            }
            Spacer()
            Button {
                selection = parks[1]
            } label: {
                Text("Ir a Sequoia")
            }
            Spacer()
        } detail: {
            getDetailView(viewName: selection?.view ?? .Secondary)
        }

//            List(parks) { park in
//                NavigationLink(park.name, value: park)
//            }
//            .navigationDestination(for: Park.self) { park in
//                getDetailView(viewName: park.view)
//            }
    }

    @ViewBuilder
    func getDetailView(viewName: AppViews) -> some View {
//        switch viewName {
//        case .Secondary:
//            SecondaryView()
//        case .Yosemite:
//            Yosemite()
//        case .Sequoia:
//            Sequoia()
//        }
        Text("Ejemplo")
    }
}
