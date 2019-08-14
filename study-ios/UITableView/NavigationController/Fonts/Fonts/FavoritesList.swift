//
//  FavoritesList.swift
//  Fonts
//
//  Created by yang on 2019/4/2.
//  Copyright © 2019 yang. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites: [String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavoriteFont(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavoriteFonts()
        }
    }
    
    func removeFavoriteFont(fontName: String) {
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavoriteFonts()
        }
    }
    
    func saveFavoriteFonts() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavoriteFonts()
    }
}
