//
//  ComicViewCell.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit

class ComicViewCell: UITableViewCell {
    @IBOutlet weak var comicNameLabel: UILabel!
    
    
    func setName(name: String){
        comicNameLabel.text = name
    }
}
