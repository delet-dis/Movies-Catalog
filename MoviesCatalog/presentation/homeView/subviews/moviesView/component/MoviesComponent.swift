//
//  MoviesComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol MoviesComponentDependency: Dependency {
    var getAuthStatusUseCase: GetAuthStatusUseCase { get }
    var getTokenUseCase: GetTokenUseCase { get }
    var getFavoritesUseCase: GetFavoritesUseCase { get }
    var deleteFavoriteUseCase: DeleteFavoriteUseCase { get }
    var loadMoviesAtPositionUseCase: LoadMoviesAtPositionUseCase { get }
}

final class MoviesComponent: Component<MoviesComponentDependency> {
    var movieDetailsComponent: MovieDetailsComponent {
        shared {
            MovieDetailsComponent(parent: self)
        }
    }

    var moviesViewViewModel: MoviesViewViewModel {
        shared {
            MoviesViewViewModel(
                getAuthStatusUseCase: dependency.getAuthStatusUseCase,
                getTokenUseCase: dependency.getTokenUseCase,
                getFavoritesUseCase: dependency.getFavoritesUseCase,
                deleteFavoriteUseCase: dependency.deleteFavoriteUseCase,
                loadMoviesAtPositionUseCase: dependency.loadMoviesAtPositionUseCase,
                movieDetailsComponent: movieDetailsComponent
            )
        }
    }

    var moviesView: some View {
        shared {
            MoviesView()
                .environmentObject(moviesViewViewModel)
        }
    }
}
