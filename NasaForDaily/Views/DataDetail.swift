//
//  DataDetail.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import SwiftUI

struct DataDetails: View {
    let data: NasaData
    
    var body: some View {
        ScrollView {
            Text("\(data.title)")
                .font(.largeTitle)
            
            AsyncImage(
                url: URL(string: data.imageURL),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 350, maxHeight: 500)
                },
                placeholder: {
                    ZStack {
                        Rectangle().fill(Color.gray).frame(width: 300, height: 500)
                        ProgressView()
                    }
                }
            )
            
            Text("\(data.explanation)")
            Divider()
            
            Text("\(data.copyright)")
        }
    }
}



struct DataDetails_Previews: PreviewProvider {
    static var previews: some View {
        DataDetails(data: NasaData(copyright: "me", explanation: "You see those stars? Pretty.", imageURL: "https://apod.nasa.gov/apod/image/2304/NlightsSeurope_Cordero_960.jpg", title: "Stars"))
    }
}
