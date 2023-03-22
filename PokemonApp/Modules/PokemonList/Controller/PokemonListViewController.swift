//
//  PokemonListViewController.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import UIKit

class PokemonListViewController: UIViewController {

    //  MARK: - Outlets

    @IBOutlet weak fileprivate var tableView: UITableView!
    
    //  MARK: - Variables
    let viewModel = PokemonListViewModel()
    var pokemonList: [Pokemon]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon List"
        registerTableView()
        registerViewModel()
    }
    
    // MARK: - Register TableView

    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PokemonCell.nameOfClass, bundle: nil), forCellReuseIdentifier: PokemonCell.nameOfClass)
    }
    
    // MARK: - Register ViewModel

    private func registerViewModel() {
        viewModel.fetchAllPokemon()
        viewModel.delegate = self
    }
    
    // MARK: - Navigate Detail
    
    private func navigateDetail(id: Int, name: String) {
        let vc = PokemonDetailViewController()
        vc.pokeId = id
        vc.pokemonName = name
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: - TableView

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.nameOfClass, for: indexPath) as? PokemonCell {
            cell.setCell(name: pokemonList?[indexPath.row].name ?? "", id: indexPath.row + 1)
            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateDetail(id: indexPath.row + 1, name: pokemonList?[indexPath.row].name ?? "")
    }
}

// MARK: - ViewModel Protocol

extension PokemonListViewController: PokemonResponseProtocol {
    func pokemonListSuccess(pokemonList: [Pokemon]) {
        self.pokemonList = pokemonList
        tableView.reloadData()
    }
    
    func pokemonListFail(error: String) {
        print(error)
    }
}
