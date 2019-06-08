//
//  UIImageViewExtension.swift
//  Pokedex
//
//  Created by William Cardozo on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
import Nuke

extension UIImage {
    static let pikachu = #imageLiteral(resourceName: "pikachu")
}

extension UIImageView {
    
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            let options = ImageLoadingOptions(placeholder: .pikachu, transition: .fadeIn(duration: 0.25), failureImage: .pikachu)
            Nuke.loadImage(with: url, options: options, into: self)
        }
    }
}
