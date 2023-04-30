//
//  ImageView.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 27.04.2023.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var data: JsonManager
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        AsyncImage(
            url: URL(string: data.arrayOfData.imageURL),
            content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
            },
            placeholder: {
                ZStack {
                    Rectangle().fill(Color.gray).frame(width: 300, height: 500)
                    ProgressView()
                }
            })
        .scaleEffect(1 + currentAmount)
        .gesture(
            MagnificationGesture()
                .onChanged { value in
                    currentAmount = value - 1
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        currentAmount = 0
                    }
                }
        )
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .environmentObject(JsonManager())
    }
}
