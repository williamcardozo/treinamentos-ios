//
//  Game.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 25/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

class Game {
    
    var cards = [Card]()
    
    var indexOfSelectedCard: Int?
    
    var attempts = 0;
    
    init(numberOfPairOfCards: Int) {
        
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            
            self.cards += [card, card]
        }
        
        self.cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if self.cards.indices.contains(index),
            !self.cards[index].isMatched {
            
            attempts += 1;
            
            if let matchedIndex = self.indexOfSelectedCard,
                matchedIndex != index {
                
                if self.cards[matchedIndex].identifier == self.cards[index].identifier {
                    self.cards[matchedIndex].isMatched = true
                    self.cards[index].isMatched = true
                }
                self.indexOfSelectedCard = nil
                self.cards[index].isFaceUp = true
            } else {
                self.indexOfSelectedCard = index
                self.faceDownCards()
                self.cards[index].isFaceUp = true
            }
            
        }
    }

    func faceDownCards() {
        for index in self.cards.indices {
            self.cards[index].isFaceUp = self.cards[index].isMatched
        }
    }
}
