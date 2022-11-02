//
//  FavoritesRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Alamofire
import Foundation

class FavoritesRepositoryImpl: FavoritesRepository {
    private static let url = NetworkingConstants.baseUrl + "/api/favorites/"

    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    private let logoutUseCase: LogoutUseCase

    init(jsonDecoder: JSONDecoder, jsonEncoder: JSONEncoder, logoutUseCase: LogoutUseCase) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder

        self.logoutUseCase = logoutUseCase
    }

    func getFavorites(token: String, completion: ((Result<Favorites, Error>) -> Void)?) {
        AF.request(
            Self.url,
            method: .get,
            encoding: JSONEncoding.default,
            headers: NetworkingHelper.getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion,
                    logoutUseCase: logoutUseCase
                )
            }
    }

    func addFavotire(token: String, id: String, completion: ((Result<VoidResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "\(id)/add",
            method: .post,
            encoding: JSONEncoding.default,
            headers: NetworkingHelper.getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion,
                    logoutUseCase: logoutUseCase
                )
            }
    }

    func deleteFavorite(token: String, id: String, completion: ((Result<VoidResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "\(id)/delete",
            method: .delete,
            encoding: JSONEncoding.default,
            headers: NetworkingHelper.getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion,
                    logoutUseCase: logoutUseCase
                )
            }
    }

    func toggleFavoriteStatus(token: String, movieId: String, completion: ((Result<Bool, Error>) -> Void)?) {
        getFavoriteStatus(token: token, movieId: movieId) { [self] result in
            switch result {
            case .success(let isFavorite):
                if isFavorite {
                    deleteFavorite(token: token, id: movieId) { result in
                        switch result {
                        case .success:
                            completion?(.success(!isFavorite))
                        case .failure(let error):
                            completion?(.failure(error))
                        }
                    }
                } else {
                    addFavotire(token: token, id: movieId) { result in
                        switch result {
                        case .success:
                            completion?(.success(!isFavorite))
                        case .failure(let error):
                            completion?(.failure(error))
                        }
                    }
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }

    func getFavoriteStatus(
        token: String,
        movieId: String,
        completion: ((Result<Bool, Error>) -> Void)?
    ) {
        getFavorites(token: token) { result in
            switch result {
            case .success(let favorites):
                if favorites.movies.contains(where: { $0.id == movieId }) {
                    completion?(.success(true))
                } else {
                    completion?(.success(false))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
