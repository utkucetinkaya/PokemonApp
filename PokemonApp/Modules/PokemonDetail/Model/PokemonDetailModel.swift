//
//  PokemonDetailModel.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation

// MARK: - PokemonDetail

struct PokemonDetailModel: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let height: Int?
    let name: String?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height
        case name
        case species
        case sprites
        case stats
        case types
        case weight
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(abilities, forKey: .abilities)
        try container.encodeIfPresent(baseExperience, forKey: .baseExperience)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(species, forKey: .species)
        try container.encodeIfPresent(sprites, forKey: .sprites)
        try container.encodeIfPresent(stats, forKey: .stats)
        try container.encodeIfPresent(types, forKey: .types)
        try container.encodeIfPresent(weight, forKey: .weight)
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abilities = try values.decodeIfPresent([Ability].self, forKey: .abilities)
        baseExperience = try values.decodeIfPresent(Int.self, forKey: .baseExperience)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        species = try values.decodeIfPresent(Species.self, forKey: .species)
        sprites = try values.decodeIfPresent(Sprites.self, forKey: .sprites)
        stats = try values.decodeIfPresent([Stat].self, forKey: .stats)
        types = try values.decodeIfPresent([TypeElement].self, forKey: .types)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}


// MARK: - Sprites
class Sprites: Codable {
 
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
  
        case frontDefault = "front_default"
    }

    init(frontDefault: String?) {
       
        self.frontDefault = frontDefault
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}

