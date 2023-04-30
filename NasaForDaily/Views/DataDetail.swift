//
//  DataDetail.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import SwiftUI

struct DataDetails: View {
    @EnvironmentObject var data: JsonManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                Text(data.arrayOfData.title)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()

                 ImageView()
                
                Text(data.arrayOfData.explanation)
                    .fontWeight(.medium)
                    .padding()
                Divider()
                
                Text(data.arrayOfData.copyright ?? "")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
            .navigationBarHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .automatic, content: {
//                    Button {
//                        UIImageWriteToSavedPhotosAlbum(image , nil, nil, nil)
//                    } label: {
//                        Image(systemName: "square.and.arrow.down")
//                    }
//
//                })
//            }
        }
    }
    
    func saveImageToPhotos() {
        var image = AsyncImage(url: URL(string: data.arrayOfData.imageURL))
    }
}



struct DataDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        DataDetails()
            .environmentObject(JsonManager())
    }
}
