//
//  MoveTableViewCell.swift
//  Pokedex
//
//  Created by William Cardozo on 11/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var typeView: UIView!
    
    func config(with model: Move) {
        nameLabel.text = model.name.capitalized
        typeImage.image =  model.type.icon
        typeView.backgroundColor = model.type.color
    }
}
