//
//  InitialScreen.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 03.05.2023.
//

import SwiftUI

struct InitialScreen: View {
    @State var animate: Bool = false
    let firstButtonColor: Color = Color("ButtonColorWarm")
    let secondButtonColor: Color = Color(red: 0.4, green: 0.4, blue: 0.74)

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    DataDetails()
                } label: {
                    Text("Press to load data")
                        .padding()
                        .background(LinearGradient(
                            colors: [secondButtonColor,
                                     firstButtonColor],
                            startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, animate ? 10 : 25)
                .shadow(color: animate ? secondButtonColor.opacity(0.7) : Color.accentColor.opacity(0.7) ,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 30 : 20)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
        }
        .onAppear(perform: addAnimation)
        .padding()
        }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 , execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

struct InitialScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InitialScreen()
        }
        .navigationTitle("Link")
    }
}
