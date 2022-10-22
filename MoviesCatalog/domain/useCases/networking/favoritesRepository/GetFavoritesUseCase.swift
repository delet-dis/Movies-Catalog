//
//  GetFavoritesUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation
import NeedleFoundation

protocol GetFavoritesUseCaseDependency: Dependency {
    var getFavoritesUseCaseProvider: GetFavoritesUseCase { get }
}

class GetFavoritesUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }

    func execute(token: String, completion: ((Result<Favorites, Error>) -> Void)? = nil) {
        favoritesRepository.getFavorites(token: token, completion: completion)
    }
}
