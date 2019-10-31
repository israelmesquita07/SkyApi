//
//  Movie.swift
//  skyAPI
//
//  Created by Israel on 29/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let id: String?
    let title: String?
    let overview: String?
    let duration: String?
    let releaseYear: String?
    let coverUrl: String?
    let backdropsUrl: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case duration
        case releaseYear = "release_year"
        case coverUrl = "cover_url"
        case backdropsUrl = "backdrops_url"
    }
}
