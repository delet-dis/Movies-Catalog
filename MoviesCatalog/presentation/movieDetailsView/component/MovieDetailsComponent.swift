//
//  MovieDetailsComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 28.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol MovieDetailsComponentDependency: Dependency {
    var loadMovieDetailsUseCase: LoadMovieDetailsUseCase { get }
}

final class MovieDetailsComponent: Component<MovieDetailsComponentDependency> {
    var movieDetailsViewViewModel: MovieDetailsViewViewModel {
        shared {
            MovieDetailsViewViewModel(
                loadMovieDetailsUseCase: dependency.loadMovieDetailsUseCase
            )
        }
    }

    var movieDetailsView: some View {
        shared {
            MovieDetailsView()
                .environmentObject(movieDetailsViewViewModel)
        }
    }
}
