//
//  Card.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 29/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

struct Card {
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var state: CardState {
        if isMatched {
            return .matched
        } else if isFaceUp {
            return .front
        } else {
            return .back
        }
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}


enum CardState {
    case back, front, matched
}
