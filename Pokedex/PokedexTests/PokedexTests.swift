//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by William Cardozo on 15/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let jsonURL = Bundle(for: PokedexTests.self).url(forResource: "pokemons", withExtension: "json")!
        let data = try! Data(contentsOf: jsonURL)
        
        XCTAssertNoThrow(try RequestMaker.decoder.decode(PokemonResponse.self, from: data))
    }
}
