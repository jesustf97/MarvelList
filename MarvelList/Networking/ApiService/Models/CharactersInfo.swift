//
//  CharactersInfo.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

struct CharactersInfo: Decodable {
  let charactersInfo: [CharacterInfo]
  
  enum CodingKeys: String, CodingKey {
    case charactersInfo = "results"
  }
}

