//
//  MoviesRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Alamofire
import Foundation

class MoviesRepositoryImpl: MoviesRepository {
    private static let url = NetworkingConstants.baseUrl + "/api/movies/"

    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    init(jsonDecoder: JSONDecoder, jsonEncoder: JSONEncoder) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }

    func loadMoviesPageAtPosition(_ position: Int, completion: ((Result<MoviesPage, Error>) -> Void)?) {
        AF.request(
            Self.url + String(position),
            method: .get,
            encoding: JSONEncoding.default,
            headers: NetworkingConstants.headers
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion
                )
            }
    }

    func loadMovieDetails(id: String, completion: ((Result<DetailedMovie, Error>) -> Void)?) {
        AF.request(
            Self.url + "details/\(id)",
            method: .get,
            encoding: JSONEncoding.default,
            headers: NetworkingConstants.headers
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion
                )
            }
    }
}
