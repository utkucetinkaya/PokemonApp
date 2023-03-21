//
//  NSObject+Ext.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation
extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
