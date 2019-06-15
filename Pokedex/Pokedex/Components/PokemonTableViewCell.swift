//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by William Cardozo on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var primaryTypeView: PokemonTypeView!
    @IBOutlet weak var secondaryTypeView: PokemonTypeView!
    
    
    func config(with model: Pokemon) {
        pictureImageView.image = #imageLiteral(resourceName: "pikachu")
        pictureImageView.loadImage(from: model.image)
        nameLabel.text = model.name.capitalized
        idLabel.text =  String(format: "#%03d", Int(model.id)!)
        
        if let primaryType = model.types.first {
            primaryTypeView.config(type: primaryType, shouldRenderLabel: false)
        }
        
        if model.types.count > 1 {
            let secondaryType = model.types[1]
            secondaryTypeView.config(type: secondaryType, shouldRenderLabel: false)
        } else {
            secondaryTypeView.isHidden = true
        }
    }
}
