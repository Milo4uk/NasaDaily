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
        NavigationView {
            ScrollView {
                Text(data.title)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()

                AsyncImage(
                    url: URL(string: data.imageURL),
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
                    }
                )
                
                Text(data.explanation)
                    .fontWeight(.medium)
                Divider()
                
                Text(data.copyright)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
        }
    }
}



struct DataDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        DataDetails(data: NasaData(copyright: "me", explanation: "You see those stars? Pretty.", imageURL: "https://apod.nasa.gov/apod/image/2304/NlightsSeurope_Cordero_960.jpg", title: "Stars"))
    }
}
