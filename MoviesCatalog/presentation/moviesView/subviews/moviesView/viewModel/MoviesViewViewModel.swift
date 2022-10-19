//
//  MoviesViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

class MoviesViewViewModel: ObservableObject {
    @Published private(set) var displayingMovies: [DisplayingMovie] = [DisplayingMovie(movie: MockDataHelper.getMockMovie(), tapClosure: nil)]
    @Published private(set) var displayingFavoriteMovies: [DisplayingFavotireMovie] = [DisplayingFavotireMovie(movie: MockDataHelper.getMockMovie(), tapClosure: nil, removeClosure: nil)]
}
