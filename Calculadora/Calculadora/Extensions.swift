//
//  Extensions.swift
//  Calculadora
//
//  Created by William Cardozo on 28/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

extension String {
    
    func toDouble() -> Double {
        return Double(self) ?? 0
    }
}

extension Double {
    
    func clean() -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
