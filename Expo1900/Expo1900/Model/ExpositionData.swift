//
//  ExpositionData.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/16.
//

struct IntroExpositionData: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct ItemsData: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case desc
    }
}
