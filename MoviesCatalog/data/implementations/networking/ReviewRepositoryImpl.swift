//
//  ReviewRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 03.11.2022.
//

import Alamofire
import Foundation

class ReviewRepositoryImpl: ReviewRepository {
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    init(jsonDecoder: JSONDecoder, jsonEncoder: JSONEncoder) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }

    func addReview(
        token: String,
        movieId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    ) {
        do {
            let encodedParameters = try jsonEncoder.encode(review)
            let parameters = try JSONSerialization.jsonObject(
                with: encodedParameters, options: .allowFragments
            ) as? [String: Any]

            AF.request(
                getUrlForReviewAdding(movieId: movieId),
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: NetworkingHelper.getHeadersWithBearer(token: token)
            ) { $0.timeoutInterval = NetworkingConstants.timeout }
                .validate()
                .response { [self] result in
                    result.processResult(jsonDecoder: jsonDecoder, completion: completion)
                }
        } catch {
            completion?(.failure(error))
        }
    }

    func editReview(
        token: String,
        movieId: String,
        reviewId: String,
        review: ReviewRequest,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    ) {
        do {
            let encodedParameters = try jsonEncoder.encode(review)
            let parameters = try JSONSerialization.jsonObject(
                with: encodedParameters, options: .allowFragments
            ) as? [String: Any]

            AF.request(
                getUrlForReviewEditingOrDeleting(movieId: movieId, reviewId: reviewId) + "edit",
                method: .put,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: NetworkingHelper.getHeadersWithBearer(token: token)
            ) { $0.timeoutInterval = NetworkingConstants.timeout }
                .validate()
                .response { [self] result in
                    result.processResult(jsonDecoder: jsonDecoder, completion: completion)
                }
        } catch {
            completion?(.failure(error))
        }
    }

    func deleteReview(
        token: String,
        movieId: String,
        reviewId: String,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    ) {
        AF.request(
            getUrlForReviewEditingOrDeleting(movieId: movieId, reviewId: reviewId) + "delete",
            method: .delete,
            encoding: JSONEncoding.default,
            headers: NetworkingHelper.getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion
                )
            }
    }

    private func getUrlForReviewAdding(movieId: String) -> String {
        return NetworkingConstants.baseUrl + "/api/movie/\(movieId)/review/add"
    }

    private func getUrlForReviewEditingOrDeleting(movieId: String, reviewId: String) -> String {
        return NetworkingConstants.baseUrl + "/api/movie/\(movieId)/review/\(reviewId)/"
    }
}
