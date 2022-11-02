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
    func toggleFavoriteStatus(token: String, movieId: String, completion: ((Result<Bool, Error>) -> Void)?)
    func getFavoriteStatus(token: String, movieId: String, completion: ((Result<Bool, Error>) -> Void)?)
}
