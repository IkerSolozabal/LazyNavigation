//
//  RadNavigationView.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 19/8/22.
//

import SwiftUI

struct RadNavigationView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
}
