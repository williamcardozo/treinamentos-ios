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
    @IBOutlet weak var primaryTypeImageView: UIImageView!
    @IBOutlet weak var secondaryTypeImageView: UIImageView!
    @IBOutlet weak var primaryTypeView: UIView!
    @IBOutlet weak var secondaryTypeView: UIView!
    
    
    func config(with model: Pokemon) {
        pictureImageView.image = #imageLiteral(resourceName: "pikachu")
        pictureImageView.loadImage(from: model.image)
        nameLabel.text = model.name.capitalized
        idLabel.text =  String(format: "#%03d", Int(model.id)!)
        
        let primaryType = model.types.first
        
        primaryTypeImageView.image = primaryType?.icon
        primaryTypeView.backgroundColor = primaryType?.color
        
        if model.types.count > 1 {
            let secondaryType = model.types[1]
            secondaryTypeImageView.image = secondaryType.icon
            secondaryTypeView.backgroundColor = secondaryType.color
            secondaryTypeImageView.superview?.isHidden = false
        } else {
            secondaryTypeImageView.superview?.isHidden = true
        }
    }
}
