//
//  ProfileRepositoryImpl.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Alamofire
import Foundation

class ProfileRepositoryImpl: ProfileRepository {
    private static let url = NetworkingConstants.baseUrl + "/api/account/profile"

    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder

    init(jsonDecoder: JSONDecoder, jsonEncoder: JSONEncoder) {
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }

    func getUserProfile(token: String, completion: ((Result<Profile, Error>) -> Void)?) {
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
                    completion: completion
                )
            }
    }

    func saveUserProfile(
        token: String,
        newProfile: Profile,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    ) {
        do {
            let encodedParameters = try jsonEncoder.encode(newProfile)
            let parameters = try JSONSerialization.jsonObject(
                with: encodedParameters, options: .allowFragments
            ) as? [String: Any]

            AF.request(
                Self.url,
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
}
