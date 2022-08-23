//
//  ColorList.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 22/8/22.
//

import SwiftUI

struct ColorList: View {
    let colors: [Color] = [.purple, .pink, .orange, .red, .orange]
    @State private var selection: Color? = nil

    var body: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selection) { color in
                NavigationLink(color.description, value: color)
            }
        } detail: {
            getDetail()
        }
    }

    @ViewBuilder
    func getDetail() -> some View {
        if let color = selection {
            ColorDetail(color: color)
        } else {
            Text("Pick a color")
        }
    }
}
