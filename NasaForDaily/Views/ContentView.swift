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
            NavigationLink(
                destination: DataDetails(),
                label: {
                    Text("Press to load data")
                        .padding()
                        .background(LinearGradient(
                            colors: [Color(red: 0.4, green: 0.4, blue: 0.74),
                                     Color(red: 0.3, green: 0.5, blue: 0.8)],
                                    startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(color: .gray, radius: 15)
                })
                .navigationTitle("Nasa Daily")
        }
        .environmentObject(network)
        .padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
