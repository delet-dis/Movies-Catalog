//
//  AuthRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Alamofire
import Foundation

class AuthRepositoryImpl: AuthRepository {
    private static let url = AppConstants.baseUrl + "/api/account/"

    private static let timeout = TimeInterval(10)

    private let jsonDecoder: JSONDecoder

    init(jsonDecoder: JSONDecoder) {
        self.jsonDecoder = jsonDecoder
    }

    func register(request: RegisterRequest, completion: ((Result<RegisterResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "register",
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default
        ) { $0.timeoutInterval = Self.timeout }
            .validate()
            .response { [self] result in
                result.processResult(jsonDecoder: jsonDecoder, completion: completion)
            }
    }

    func login(request: LoginRequest, completion: ((Result<LoginResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "login",
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default
        ) { $0.timeoutInterval = Self.timeout }
            .validate()
            .response { [self] result in
                result.processResult(jsonDecoder: jsonDecoder, completion: completion)
            }
    }

    func logout(request: LogoutRequest, completion: ((Result<LogoutResponse, Error>) -> Void)?) {
        AF.request(
            Self.url + "logout",
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default
        ) { $0.timeoutInterval = Self.timeout }
            .validate()
            .response { [self] result in
                result.processResult(jsonDecoder: jsonDecoder, completion: completion)
            }
    }
}
