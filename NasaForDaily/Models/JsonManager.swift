//
//  JSONManager.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import Foundation

class JsonManager: ObservableObject {
    @Published var arrayOfData: NasaData = NasaData(copyright: "", explanation: "", imageURL: "", title: "")
    
    init() {
        getJsonDataFromNasa()
    }
    
    func getJsonDataFromNasa() {
        
        guard let urlPath = URL(string: "https://api.nasa.gov/planetary/apod?api_key=ymknBMTXK6RUe6QmYhpAXJtTl2XEQ1Wcf4dvSCiO") else {
            fatalError("missing url")
        }
        
        let request = URLRequest(url: urlPath)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error)  in
            if error != nil {
                print("request error")
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let nasaData = try JSONDecoder().decode(NasaData.self, from: data)
                        self.arrayOfData = nasaData
                        print(nasaData)
                    } catch {
                        print("Error decoding NasaData: \(error)")
                    }

                }
            }
            let jsonString = String(data: data!, encoding: .utf8)
            print(jsonString!)
        } .resume()
    }
}
