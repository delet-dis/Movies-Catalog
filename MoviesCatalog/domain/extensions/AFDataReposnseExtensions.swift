//
//  AFDataResponseExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Alamofire
import Foundation

extension AFDataResponse {
    func processResult<T: Codable>(
        jsonDecoder: JSONDecoder,
        completion: ((Result<T, Error>) -> Void)?,
        logoutUseCase: LogoutUseCase? = nil
    ) {
        if let underlyingError = self.error?.asAFError?.underlyingError {
            completion?(.failure(underlyingError))

            return
        }

        if self.response?.statusCode == NetworkingConstants.unauthorizedStatusCode {
            logoutUseCase?.execute { _ in
                completion?(.failure(NetworkingErrorsEnum.sessionIsExpired))
            }

            return
        }

        guard var response = self.data else {
            completion?(.failure(NetworkingErrorsEnum.unableToGetData))

            return
        }

        if case .failure = self.result {
            do {
                let decodedError = try jsonDecoder.decode(NetworkingError.self, from: response)

                if let errorTitle = decodedError.title {
                    completion?(.failure(
                        NSError.createErrorWithLocalizedDescription(errorTitle)
                    ))

                    return
                }

                if let errorMessage = decodedError.message {
                    completion?(.failure(
                        NSError.createErrorWithLocalizedDescription(errorMessage)
                    ))

                    return
                }
            } catch {
                completion?(.failure(NetworkingErrorsEnum.unableToGetData))
            }

            return
        }

        do {
            // Thanks to the buggy api
            if T.self == Profile.self {
                let profile = Profile.getNormalizedProfileFromBrokenData(response)

                if let profileAsGeneric = profile as? T {
                    completion?(.success(profileAsGeneric))

                    return
                }
            }

            let decodedResponse = try jsonDecoder.decode(T.self, from: response)

            completion?(.success(decodedResponse))
        } catch {
            completion?(.failure(error))
        }
    }
}
