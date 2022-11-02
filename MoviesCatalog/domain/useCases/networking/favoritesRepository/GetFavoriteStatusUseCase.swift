//
//  GetFavoriteStatusUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 02.11.2022.
//

import Foundation
import NeedleFoundation

protocol GetFavoriteStatusUseCaseDependency: Dependency {
    var getFavoriteStatusUseCaseProvider: GetFavoriteStatusUseCase { get }
}

class GetFavoriteStatusUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }

    func execute(token: String, movieId: String, completion: ((Result<Bool, Error>) -> Void)? = nil) {
        favoritesRepository.getFavoriteStatus(token: token, movieId: movieId, completion: completion)
    }
}
