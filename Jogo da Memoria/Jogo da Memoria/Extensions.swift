//
//  Extensions.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 25/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

extension Bool {
    
    mutating func toggle() {
        self = !self
    }
}


extension Array {
    
    mutating func removeRandom() -> Element {
        let index = Int.random(in: self.indices)
        
        return self.remove(at: index)
    }
}
