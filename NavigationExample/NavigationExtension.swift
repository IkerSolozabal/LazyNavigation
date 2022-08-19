//
//  NavigationExtension.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

public extension NavigationLink where Label == EmptyView {
    init?(
        _ binding: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            destination: destination(),
            isActive: binding,
            label: EmptyView.init
        )
    }
}

public extension View {
    @ViewBuilder
    func navigate<Destination: View>(
        isPresented binding: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) -> some View {
        if #available(iOS 15.0, *) {
            background(alignment: .center) {
                NavigationLink(binding) {
                    destination()
                }
            }
        } else {
            background(NavigationLink(
                binding,
                destination: destination
            ))
        }
    }
}
