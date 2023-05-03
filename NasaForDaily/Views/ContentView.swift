//
//  ContentView.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: JsonManager
    
    var body: some View {
        NavigationView {
            ZStack {
                InitialScreen()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            .navigationTitle("Nasa Daily")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView().preferredColorScheme(.dark)
            ContentView().preferredColorScheme(.light)
        }
    }
}
