//
//  FinishViewController.swift
//  Jogo da Memoria
//
//  Created by William Cardozo on 29/05/19.
//  Copyright © 2019 William Cardozo. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBAction func touchPlayAgain(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
