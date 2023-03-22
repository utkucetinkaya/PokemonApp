//
//  PokemonDetailViewController.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
   
    
    // MARK: - Variables
    
    var viewModel = PokemonDetailViewModel()
    var pokemonDetail: PokemonDetailModel?
    var pokeId: Int?
    var pokemonName: String = ""

    // MARK: - Outlets

    @IBOutlet weak fileprivate var heightLabel: UILabel!
    @IBOutlet weak fileprivate var widthLabel: UILabel!
    @IBOutlet weak fileprivate var powerLabel: UILabel!
    @IBOutlet weak fileprivate var nameLabel: UILabel!
    @IBOutlet weak fileprivate var detailImageView: UIImageView!
    @IBOutlet weak fileprivate var tableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pokemonName
        registerTableView()
        registerViewModel()
    }

    // MARK: - Register ViewModel
    func registerViewModel() {
        viewModel.delegate = self
        viewModel.fetchPokemonDetail(id: pokeId ?? 0)
    }
    
    private func setUI(pokemon: PokemonDetailModel) {
        let url = URL(string: pokemon.sprites?.frontDefault ?? "")
        detailImageView.kf.setImage(with: url)
        
        heightLabel.text = "Height: \(pokemon.height ?? 0)"
        widthLabel.text = "Width: \(pokemon.weight ?? 0)"
        powerLabel.text = "Power: \(pokemon.baseExperience ?? 0)"
        nameLabel.text = "Name: \(pokemon.name ?? "")"
    }

    // MARK: - Register TableView

    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: AbilitiesCell.nameOfClass, bundle: nil), forCellReuseIdentifier: AbilitiesCell.nameOfClass)
    }
}

// MARK: - TableView

extension PokemonDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonDetail?.abilities?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AbilitiesCell.nameOfClass, for: indexPath) as? AbilitiesCell {
            cell.textLabel?.text = pokemonDetail?.abilities?[indexPath.row].ability?.name ?? ""
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Abilities"
    }
}

// MARK: - PokemonDetailResponseProtocol

extension PokemonDetailViewController: PokemonDetailResponseProtocol {
    
    func pokemonDetailSuccess(pokemon: PokemonDetailModel) {
        pokemonDetail = pokemon
        setUI(pokemon: pokemon)
        tableView.reloadData()
    }
    
    func pokemonDetailFail(error: String) {
        print(error)
    }
}
