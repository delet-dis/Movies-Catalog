//
//  DeleteFavoriteUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation
import NeedleFoundation

protocol DeleteFavoriteUseCaseDependency: Dependency {
    var deleteFavoriteUseCaseProvider: DeleteFavoriteUseCase { get }
}

class DeleteFavoriteUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }

    func execute(token: String, id: String, completion: ((Result<VoidResponse, Error>) -> Void)? = nil) {
        favoritesRepository.deleteFavorite(token: token, id: id, completion: completion)
    }
}
