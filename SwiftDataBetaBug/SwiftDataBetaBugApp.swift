//
//  SwiftDataBetaBugApp.swift
//  SwiftDataBetaBug
//
//  Created by Jamie McDaniel on 8/27/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataBetaBugApp: App {

    var body: some Scene {
        WindowGroup {
            AirportList()
        }
        .modelContainer(for: Airport.self)
    }
}
