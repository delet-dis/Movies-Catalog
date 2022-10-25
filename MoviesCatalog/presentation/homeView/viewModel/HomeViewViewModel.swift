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
    let profileComponent: ProfileComponent?

    init(
        moviesComponent: MoviesComponent? = nil,
        profileComponent: ProfileComponent? = nil
    ) {
        self.moviesComponent = moviesComponent
        self.profileComponent = profileComponent
    }

    func showMovies() {
        homeViewDislayingMode = .movies
    }

    func showProfile() {
        homeViewDislayingMode = .profile
    }
}
