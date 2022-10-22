//
//  LoadMovieDetailsUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation
import NeedleFoundation

protocol LoadMovieDetailsUseCaseDependency: Dependency {
    var loadMovieDetailsUseCaseProvider: LoadMovieDetailsUseCase { get }
}

class LoadMovieDetailsUseCase {
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }

    func execute(id: String, completion: ((Result<DetailedMovie, Error>) -> Void)? = nil) {
        moviesRepository.loadMovieDetails(id: id, completion: completion)
    }
}
