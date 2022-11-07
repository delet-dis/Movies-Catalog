//
//  AddReviewUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 07.11.2022.
//

import Foundation
import NeedleFoundation

protocol AddReviewUseCaseDependency: Dependency {
    var addReviewUseCaseProvider: AddReviewUseCase { get }
}

class AddReviewUseCase {
    private let reviewRepository: ReviewRepository

    init(reviewRepository: ReviewRepository) {
        self.reviewRepository = reviewRepository
    }

    func execute(
        token: String,
        movieId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)? = nil
    ) {
        reviewRepository.addReview(token: token, movieId: movieId, review: review, completion: completion)
    }
}
