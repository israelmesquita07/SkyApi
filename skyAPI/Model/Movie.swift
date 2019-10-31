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

/*
 {
      "title":"Doutor Estranho",
      "overview":"Stephen Strange (Benedict Cumberbatch) leva uma vida bem sucedida como neurocirurgião. Sua vida muda completamente quando sofre um acidente de carro e fica com as mãos debilitadas. Devido a falhas da medicina tradicional, ele parte para um lugar inesperado em busca de cura e esperança, um misterioso enclave chamado Kamar-Taj, localizado em Katmandu. Lá descobre que o local não é apenas um centro medicinal, mas também a linha de frente contra forças malignas místicas que desejam destruir nossa realidade. Ele passa a treinar e adquire poderes mágicos, mas precisa decidir se vai voltar para sua vida comum ou defender o mundo.",
      "duration":"1h 55m",
      "release_year":"2017",
      "cover_url":"https://image.tmdb.org/t/p/w1280/dsAQmTOCyMDgmiPp9J4aZTvvOJP.jpg",
      "backdrops_url":[
         "https://image.tmdb.org/t/p/w1066_and_h600_bestv2/tFI8VLMgSTTU38i8TIsklfqS9Nl.jpg",
         "https://image.tmdb.org/t/p/w1066_and_h600_bestv2/sDNhWjd4X7c0oOlClkkwvqVOo45.jpg"
      ],
      "id":"090f0d8fs9d0dfdf"
   },
 */
