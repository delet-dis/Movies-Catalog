//
//  LoadMoviesAtPositionUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation
import NeedleFoundation

protocol LoadMoviesAtPositionUseCaseDependency: Dependency {
    var loadMoviesAtPositionUseCaseProvider: LoadMoviesAtPositionUseCase { get }
}

class LoadMoviesAtPositionUseCase {
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }

    func execute(_ position: Int = 1, completion: ((Result<MoviesPage, Error>) -> Void)? = nil) {
        moviesRepository.loadMoviesPageAtPosition(position, completion: completion)
    }
}
