//
//  FavoritesRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 21.10.2022.
//

import Foundation

protocol FavoritesRepository {
    func getFavorites(token: String, completion: ((Result<Favorites, Error>) -> Void)?)
    func addFavotire(token: String, id: String, completion: ((Result<VoidResponse, Error>) -> Void)?)
    func deleteFavorite(token: String, id: String, completion: ((Result<VoidResponse, Error>) -> Void)?)
}
