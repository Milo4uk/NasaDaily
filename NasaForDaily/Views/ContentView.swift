//
//  ContentView.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var network = JsonManager()

    var body: some View {
        NavigationView {
            NavigationLink("Press to load Data", destination: DataDetails(data: network.arrayOfData))
                .navigationTitle("Nasa Daily")
        }
        .padding()
        }
    }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
            .environmentObject(JsonManager())
    }
}
