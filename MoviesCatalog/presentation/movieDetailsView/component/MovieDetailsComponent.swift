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
    var getFavoriteStatusUseCase: GetFavoriteStatusUseCase { get }
    var toggleFavoriteStatusUseCase: ToggleFavoriteStatusUseCase { get }
    var getTokenUseCase: GetTokenUseCase { get }
    var getUserProfileUseCase: GetUserProfileUseCase { get }
    var addReviewUseCase: AddReviewUseCase { get }
    var editReviewUseCase: EditReviewUseCase { get }
    var deleteReviewUseCase: DeleteReviewUseCase { get }
}

final class MovieDetailsComponent: Component<MovieDetailsComponentDependency> {
    var movieDetailsViewViewModel: MovieDetailsViewViewModel {
        shared {
            MovieDetailsViewViewModel(
                loadMovieDetailsUseCase: dependency.loadMovieDetailsUseCase,
                getFavoriteStatusUseCase: dependency.getFavoriteStatusUseCase,
                toggleFavoriteStatusUseCase: dependency.toggleFavoriteStatusUseCase,
                getTokenUseCase: dependency.getTokenUseCase,
                getUserProfileUseCase: dependency.getUserProfileUseCase,
                addReviewUseCase: dependency.addReviewUseCase,
                editReviewUseCase: dependency.editReviewUseCase,
                deleteReviewUseCase: dependency.deleteReviewUseCase
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
