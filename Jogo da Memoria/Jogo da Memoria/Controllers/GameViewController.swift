//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 25/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    let finishSegue = "show-finish"
    lazy var game: Game = Game(numberOfPairOfCards: buttons.count / 2)
    
    var cardTextProvider: CardTextProvider!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = buttons.firstIndex(of: sender) {
            self.game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(String(game.attempts))"
        
        for (index, card) in game.cards.enumerated() {
            let button = self.buttons[index]
            
            self.setCardState(withButton: button, withCard: card)
        }
        
        if game.cards.allSatisfy({ $0.isMatched }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                self.performSegue(withIdentifier: self.finishSegue, sender: nil)
            }
        }
    }
    
    private func setCardState(withButton button: UIButton, withCard card: Card) {
        
        switch card.state {
            case .back:
                self.setBackground(withButton: button, withTitle: "", withColor: .orange)
                break
            case .front:
                self.setBackground(withButton: button, withTitle: self.cardTextProvider.text(for: card.identifier), withColor: .white)
                break
            case .matched:
                button.isEnabled = false
                self.setBackground(withButton: button, withTitle: self.cardTextProvider.text(for: card.identifier), withColor: .clear)
                break
        }
    }
    
    private func setBackground(withButton button: UIButton, withTitle title: String, withColor color: UIColor) {
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
    }
}

