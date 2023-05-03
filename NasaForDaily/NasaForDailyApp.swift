//
//  NasaForDailyApp.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import SwiftUI

@main
struct NasaForDailyApp: App {
    @StateObject var network: JsonManager = JsonManager()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
            .environmentObject(network)
        }
    }
}
