//
//  EditReviewUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import Foundation
import NeedleFoundation

protocol EditReviewUseCaseDependency: Dependency {
    var editReviewUseCaseProvider: EditReviewUseCase { get }
}

class EditReviewUseCase {
    private let reviewRepository: ReviewRepository

    init(reviewRepository: ReviewRepository) {
        self.reviewRepository = reviewRepository
    }

    func execute(
        token: String,
        movieId: String,
        reviewId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)? = nil
    ) {
        reviewRepository.editReview(
            token: token,
            movieId: movieId,
            reviewId: reviewId,
            review: review,
            completion: completion
        )
    }
}
