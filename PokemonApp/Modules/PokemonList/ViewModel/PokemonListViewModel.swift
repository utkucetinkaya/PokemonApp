//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation
import Alamofire
// MARK: - PokemonResponseProtocol

protocol PokemonResponseProtocol: AnyObject {
    func pokemonListSuccess(pokemonList: [Pokemon])
    func pokemonListFail(error: String)
}

class PokemonListViewModel {
   
    // MARK: - Variables

    private let networkManager = NetworkManager()

    var pokemonList: [Pokemon] = []
    weak var delegate: PokemonResponseProtocol?

    // MARK: - Fetch All Pokemon
 
    func fetchAllPokemon() {
        networkManager.request(router: .getPokemonList) { [weak self] (result: Result<PokemonListModel, Error>) in
            switch result {
            case .success(let pokemonList):
                self?.delegate?.pokemonListSuccess(pokemonList: pokemonList.results)
            case .failure(let error):
                self?.delegate?.pokemonListFail(error: error.localizedDescription)
            }
        }
    }
}
