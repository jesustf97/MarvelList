//
//  Image.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

struct Image: Decodable {
    let path: String
    let format: String
  
  enum CodingKeys: String, CodingKey {
    case path
    case format = "extension"
  }
}
