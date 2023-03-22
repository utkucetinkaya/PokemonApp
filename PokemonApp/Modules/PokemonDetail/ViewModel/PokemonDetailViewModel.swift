//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation
import Alamofire
// MARK: - PokemonDetailResponseProtocol

protocol PokemonDetailResponseProtocol: AnyObject {
    func pokemonDetailSuccess(pokemon: PokemonDetailModel)
    func pokemonDetailFail(error: String)
}

class PokemonDetailViewModel {
   
    // MARK: - Variables

    private let networkManager = NetworkManager()
    
    var pokemon: [PokemonDetailModel] = []
    weak var delegate: PokemonDetailResponseProtocol?

    // MARK: - Fetch Pokemon Detail
 
    func fetchPokemonDetail(id: Int) {
        networkManager.request(router: .getPokemonDetail(id: id)) { (result: Result<PokemonDetailModel, Error>) in
            switch result {
            case .success(let pokemonDetail):
                self.delegate?.pokemonDetailSuccess(pokemon: pokemonDetail)
            case .failure(let error):
                self.delegate?.pokemonDetailFail(error: error.localizedDescription)
            }
        }
    }
}
