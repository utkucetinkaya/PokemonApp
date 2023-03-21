//
//  SplashViewController.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 21.03.2023.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = PokemonListViewController()
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
