//
//  CharacterInfo.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

struct CharacterInfo: Decodable {

    let id: Int
    let name: String
    let description: String
    let urlImage: Image
    let comics: Comics
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case description
    case urlImage = "thumbnail"
    case comics = "comics"
  }
}
