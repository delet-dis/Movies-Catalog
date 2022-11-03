//
//  AuthRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Alamofire
import Foundation

class AuthRepositoryImpl: AuthRepository {
    private static let url = "\(NetworkingConstants.baseUrl)/api/account/"

    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    init(jsonDecoder: JSONDecoder, jsonEncoder: JSONEncoder) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }

    func register(request: RegisterRequest, completion: ((Result<RegisterResponse, Error>) -> Void)?) {
        do {
            let encodedParameters = try jsonEncoder.encode(request)
            let parameters = try JSONSerialization.jsonObject(
                with: encodedParameters, options: .allowFragments
            ) as? [String: Any]

            AF.request(
                Self.url + "register",
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: NetworkingConstants.headers
            ) { $0.timeoutInterval = NetworkingConstants.timeout }
                .validate()
                .response { [self] result in
                    result.processResult(jsonDecoder: jsonDecoder, completion: completion)
                }
        } catch {
            completion?(.failure(error))
        }
    }

    func login(request: LoginRequest, completion: ((Result<LoginResponse, Error>) -> Void)?) {
        do {
            let encodedParameters = try jsonEncoder.encode(request)
            let parameters = try JSONSerialization.jsonObject(
                with: encodedParameters, options: .allowFragments
            ) as? [String: Any]

            AF.request(
                Self.url + "login",
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: NetworkingConstants.headers
            ) { $0.timeoutInterval = NetworkingConstants.timeout }
                .validate()
                .response { [self] result in
                    result.processResult(jsonDecoder: jsonDecoder, completion: completion)
                }
        } catch {
            completion?(.failure(error))
        }
    }

    func logout(completion: ((Result<LogoutResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "logout",
            method: .post,
            encoding: JSONEncoding.default,
            headers: NetworkingConstants.headers
        ) { $0.timeoutInterval = NetworkingConstants.timeout }
            .validate()
            .response { [self] result in
                result.processResult(jsonDecoder: jsonDecoder, completion: completion)
            }
    }
}
