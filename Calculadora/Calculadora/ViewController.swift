//
//  ViewController.swift
//  Calculadora
//
//  Created by William Cardozo on 26/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var primeiroNumero: Double = 0
    var segundoNumero: Double = 0
    var acao: AcaoCalculadora? = nil
    var estaExecutandoAcao = false
    
    @IBOutlet weak var numeroExibidoLabel: UILabel!
    
    @IBAction func onClickNumero(_ sender: UIButton) {
        var valorExibido = self.numeroExibidoLabel.text ?? ""
        
        if valorExibido == "0" || estaExecutandoAcao {
            valorExibido = ""
        }
       
        let tituloDoBotao = sender.titleLabel?.text ?? ""
        
        let numeroNovo = "\(valorExibido)\(tituloDoBotao)"
        let numeroNovoConvertido = numeroNovo.toDouble()
        
        self.numeroExibidoLabel.text = numeroNovoConvertido.clean()
        self.estaExecutandoAcao = false
    }
    
    @IBAction func onClickAcao(_ sender: UIButton) {
        let acao = AcaoCalculadora(rawValue: sender.tag)
        let numeroExibido = self.numeroExibidoLabel.text ?? ""
        self.estaExecutandoAcao = true;
        
        if self.acao != nil {
            self.segundoNumero = numeroExibido.toDouble()
            executaAcao()
        } else {
            self.primeiroNumero = numeroExibido.toDouble()
            self.acao = acao
            
            if acao == AcaoCalculadora.X_ELEVADO_2 || acao == AcaoCalculadora.RAIZ_QUADRADA {
                self.executaAcao()
            }
        }
        
    }
    
    @IBAction func onClickIgual(_ sender: UIButton) {
        let numeroExibido = self.numeroExibidoLabel.text ?? ""
        self.segundoNumero = numeroExibido.toDouble()
        self.estaExecutandoAcao = true
        self.executaAcao()
        self.acao = nil
    }
    
    
    @IBAction func onClickLimpar(_ sender: UIButton) {
        self.primeiroNumero = 0
        self.segundoNumero = 0
        self.acao = nil
        self.numeroExibidoLabel.text = "0"
        self.estaExecutandoAcao = false
    }
    
    
    private func executaAcao() {
        
        if let acao = self.acao {
            var novoValor = 0.0
            
            switch acao {
                case AcaoCalculadora.SUBTRAIR:
                    novoValor = Calculadora.subtracao(x: primeiroNumero, y: segundoNumero)
                case AcaoCalculadora.SOMAR:
                    novoValor = Calculadora.soma(x: primeiroNumero, y: segundoNumero)
                case AcaoCalculadora.MULTIPLICAR:
                    novoValor = Calculadora.multiplicacao(x: primeiroNumero, y: segundoNumero)
                case AcaoCalculadora.DIVIDIR:
                    novoValor = Calculadora.divisao(x: primeiroNumero, y: segundoNumero)
                case AcaoCalculadora.RAIZ_QUADRADA:
                    novoValor = Calculadora.raizQuadrada(x: primeiroNumero)
                case AcaoCalculadora.X_ELEVADO_2:
                    novoValor = Calculadora.xAoQuadrado(x: primeiroNumero)
            }
            
            self.numeroExibidoLabel.text = novoValor.clean()
            self.primeiroNumero = novoValor
            self.segundoNumero = 0
            self.acao = nil
        }
    }
}
