//
//  HomeViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 20.10.2022.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    @Published private(set) var homeViewDislayingMode: HomeViewDisplayingModeEnum = .movies

    let moviesComponent: MoviesComponent?

    init(moviesComponent: MoviesComponent? = nil) {
        self.moviesComponent = moviesComponent
    }

    func showMovies() {
        homeViewDislayingMode = .movies
    }

    func showProfile() {
        homeViewDislayingMode = .profile
    }
}
