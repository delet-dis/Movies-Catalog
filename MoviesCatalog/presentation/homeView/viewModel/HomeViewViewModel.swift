//
//  HomeViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 20.10.2022.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    let moviesComponent: MoviesComponent?

    init(moviesComponent: MoviesComponent? = nil) {
        self.moviesComponent = moviesComponent
    }
}
