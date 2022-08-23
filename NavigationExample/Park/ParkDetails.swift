//
//  ParkDetails.swift
//  NavigationExample
//
//  Created by Iker Solozabal Granados on 22/8/22.
//

import SwiftUI

struct ParkDetails: View {
    let park: Park
    var body: some View {
        Text(park.name)
    }
}
