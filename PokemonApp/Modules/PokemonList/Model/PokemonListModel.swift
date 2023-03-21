//
//  PokemonListModel.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation

struct PokemonListModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
