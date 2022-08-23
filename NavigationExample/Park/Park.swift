//
//  Park.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 22/8/22.
//

import Foundation

struct Park: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let view: AppViews
}
