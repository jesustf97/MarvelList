//
//  Response.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

struct Response: Decodable {
  let data: CharactersInfo
  
  enum CodingKeys: String, CodingKey {
    case data
  }
}
