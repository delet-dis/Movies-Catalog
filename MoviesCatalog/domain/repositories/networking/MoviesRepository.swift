//
//  MoviesRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation

protocol MoviesRepository {
    func loadMoviesPageAtPosition(_ position: Int, completion: ((Result<MoviesPage, Error>) -> Void)?)
    func loadMovieDetails(id: String, completion: ((Result<DetailedMovie, Error>) -> Void)?)
}
