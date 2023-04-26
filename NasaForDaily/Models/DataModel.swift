//
//  DataModel.swift
//  NasaForDaily
//
//  Created by Mila ✨ on 26.04.2023.
//

import Foundation

struct NasaData: Decodable {
    let copyright: String
    let explanation: String
    let imageURL: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case copyright
        case explanation
        case imageURL = "hdurl"
        case title
    }
}
