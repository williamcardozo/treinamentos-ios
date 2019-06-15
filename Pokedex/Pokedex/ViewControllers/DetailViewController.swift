//
//  DetailViewController.swift
//  Pokedex
//
//  Created by William Cardozo on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewCenterVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonTypeView: PokemonTypeView!
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
        
        if let type = self.pokemon?.types.first {
            self.pokemonTypeView.config(type: type)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadPokemonAnimation()
        self.requestPokemon()
    }
    
    func loadPokemonAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.pokemonImageView.alpha = 0.2
        })
    }
    
    func initialConfig() {
        if let pokemon = self.pokemon {
            let pokemonTypeColor = pokemon.types.first?.color
            self.gradientView.startColor = pokemonTypeColor ?? .black
            self.gradientView.endColor = pokemonTypeColor?.lighter() ?? .white
            
            self.pokemonImageView.loadImage(from: pokemon.image)
        }
    }
    
    func requestPokemon() {
        if let pokemon = self.pokemon {
            let requestMaker = RequestMaker()
            
            requestMaker.make(withEndpointUrl: .details(query: pokemon.id)) { (pokemon: Pokemon) in
                
                DispatchQueue.main.async {
                    self.animateImagePokemonToTop()
                }
            }
        }
    }
    
    func animateImagePokemonToTop() {
        self.pokemonImageView.layer.removeAllAnimations()
        self.pokemonImageViewCenterVerticallyConstraint.priority = UILayoutPriority(rawValue: 900)
        self.pokemonImageViewTopConstraint.priority = UILayoutPriority(rawValue: 999)
        self.pokemonImageViewHeightConstraint.constant = 80
        self.pokemonImageViewWidthConstraint.constant = 80
        
        UIView.animate(withDuration: 1, animations: {
            self.pokemonImageView.alpha = 1
            self.view.layoutIfNeeded()
        })
    }
    
}

