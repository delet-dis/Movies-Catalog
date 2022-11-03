//
//  ToggleFavoriteStatusUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation
import NeedleFoundation

protocol ToggleFavoriteStatusUseCaseDependency: Dependency {
    var toggleFavoriteStatusUseCaseProvider: ToggleFavoriteStatusUseCase { get }
}

class ToggleFavoriteStatusUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }

    func execute(token: String, movieId: String, completion: ((Result<Bool, Error>) -> Void)? = nil) {
        favoritesRepository.toggleFavoriteStatus(token: token, movieId: movieId, completion: completion)
    }
}
