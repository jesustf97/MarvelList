//
//  CharacterViewCellTableViewCell.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//


import UIKit

class CharacterViewCell: UITableViewCell {
    @IBOutlet weak var characterNameLabel: UILabel!
    
    func setName(name: String){
        characterNameLabel.text = name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.backgroundColor = UIColor.black
        } else {
            let customColorItemDefault = UIColor(red: 240.0, green: 19.0, blue: 30.0, alpha: 0)
            contentView.backgroundColor = customColorItemDefault
        }
    }
}
