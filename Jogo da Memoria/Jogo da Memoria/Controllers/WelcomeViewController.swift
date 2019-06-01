//
//  WelcomeViewController.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 29/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let gameSegue = "show-segue"
    
    var cardTextProvider: CardTextProvider?
    
    @IBAction func touchCuteAnimals(_ sender: Any) {
        cardTextProvider = CuteAnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
        
    }

    @IBAction func touchFlags(_ sender: Any) {
        cardTextProvider = FlagsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvider
        }
    }
}
