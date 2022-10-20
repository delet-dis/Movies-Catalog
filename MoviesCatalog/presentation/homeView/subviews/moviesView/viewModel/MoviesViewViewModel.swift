//
//  MoviesViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

class MoviesViewViewModel: ObservableObject {
    @Published private(set) var displayingHeaderMovie: DisplayingMovie?
    @Published private(set) var displayingMovies: [DisplayingMovie] = []
    @Published private(set) var displayingFavoriteMovies: [DisplayingFavotireMovie] = []
}
