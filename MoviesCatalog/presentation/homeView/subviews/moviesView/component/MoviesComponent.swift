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
    var getTokenUseCase: GetTokenUseCase { get }
    var getFavoritesUseCase: GetFavoritesUseCase { get }
    var deleteFavoriteUseCase: DeleteFavoriteUseCase { get }
}

final class MoviesComponent: Component<MoviesComponentDependency> {
    var moviesViewViewModel: MoviesViewViewModel {
        shared {
            MoviesViewViewModel(
                getTokenUseCase: dependency.getTokenUseCase,
                getFavoritesUseCase: dependency.getFavoritesUseCase,
                deleteFavoriteUseCase: dependency.deleteFavoriteUseCase
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
