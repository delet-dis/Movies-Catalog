//
//  ReviewRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 03.11.2022.
//

import Foundation

protocol ReviewRepository {
    func addReview(
        token: String,
        movieId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    )

    func editReview(
        token: String,
        movieId: String,
        reviewId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    )

    func deleteReview(
        token: String,
        movieId: String,
        reviewId: String,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    )
}
