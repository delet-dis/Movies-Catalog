//
//  DeleteReviewUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import Foundation
import NeedleFoundation

protocol DeleteReviewUseCaseDependency: Dependency {
    var deleteReviewUseCaseProvider: DeleteReviewUseCase { get }
}

class DeleteReviewUseCase {
    private let reviewRepository: ReviewRepository

    init(reviewRepository: ReviewRepository) {
        self.reviewRepository = reviewRepository
    }

    func execute(
        token: String,
        movieId: String,
        reviewId: String,
        completion: ((Result<VoidResponse, Error>) -> Void)? = nil
    ) {
        reviewRepository.deleteReview(
            token: token,
            movieId: movieId,
            reviewId: reviewId,
            completion: completion
        )
    }
}
