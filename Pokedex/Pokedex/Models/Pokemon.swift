//
//  Pokemon.swift
//  Pokedex
//
//  Created by William Cardozo on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    let list: PokemonList
}

struct PokemonList: Codable {
    let pokemons: [Pokemon]
}

struct Status: Codable {
    let value: Int
    let name: String
}

struct Pokemon: Codable {
    let id: String
    let name: String 
    let image: String
    let description: String?
    let types: [PokemonType]
    let stats: [Status]?
}
