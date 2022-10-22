//
//  FavoritesRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Alamofire
import Foundation

class FavoritesRepositoryImpl: FavoritesRepository {
    private static let url = AppConstants.baseUrl + "/api/favorites/"

    private static let timeout = TimeInterval(10)

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
            headers: getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = Self.timeout }
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
            headers: getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = Self.timeout }
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
            headers: getHeadersWithBearer(token: token)
        ) { $0.timeoutInterval = Self.timeout }
            .validate()
            .response { [self] result in
                result.processResult(
                    jsonDecoder: jsonDecoder,
                    completion: completion,
                    logoutUseCase: logoutUseCase
                )
            }
    }

    private func getHeadersWithBearer(token: String) -> HTTPHeaders {
        var headers: HTTPHeaders = AppConstants.networkingHeaders
        headers.add(.authorization(bearerToken: token))

        return headers
    }
}
