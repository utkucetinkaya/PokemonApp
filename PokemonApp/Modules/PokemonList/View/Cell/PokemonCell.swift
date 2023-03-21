//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import UIKit
import Kingfisher
class PokemonCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak fileprivate var pokemonImageView: UIImageView!
    @IBOutlet weak fileprivate var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    // MARK: - Set Cell

    func setCell(name: String, id: Int) {
        pokemonImageView.kf.setImage(with: URL(string: Constants.shared.imageURL + "\(id).png"))
        nameLabel.text = name

    }
}
