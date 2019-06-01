//
//  Calculadora.swift
//  Calculadora
//
//  Created by William Cardozo on 26/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import Foundation

class Calculadora {
   
    static func soma(x primeiroNumero: Double, y segundoNumero: Double) -> Double {
        return primeiroNumero + segundoNumero
    }
    
    static func subtracao(x primeiroNumero: Double, y segundoNumero: Double) -> Double {
        return primeiroNumero - segundoNumero
    }
    
    static func multiplicacao(x primeiroNumero: Double, y segundoNumero: Double) -> Double {
        return primeiroNumero * segundoNumero
    }
    
    static func divisao(x primeiroNumero: Double, y segundoNumero: Double) -> Double {
        return primeiroNumero / segundoNumero
    }
    
    static func xAoQuadrado(x numero: Double) -> Double {
        return pow(numero, 2)
    }
    
    static func raizQuadrada(x numero: Double) -> Double {
        return sqrt(numero)
    }
}


enum AcaoCalculadora: Int {
    case SUBTRAIR = 1
    case SOMAR = 2
    case MULTIPLICAR = 3
    case DIVIDIR = 4
    case RAIZ_QUADRADA = 5
    case X_ELEVADO_2 = 6
}
