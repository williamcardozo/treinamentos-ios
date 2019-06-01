//
//  CardTextProvider.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 29/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

protocol CardTextProvider: AnyObject {
    
    var texts: [Int: String] { get set }
    var options: Array<String> { get set }

    func text(for identifier: Int) -> String
}

extension CardTextProvider {
    
    func text(for identifier: Int) -> String {
        if let text = self.texts[identifier] {
            return text
        }
        
        let text = self.options.removeRandom()
        
        self.texts[identifier] = text
        
        return text
    }
}
