//
//  AFDataResponseExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Alamofire
import Foundation

extension AFDataResponse {
    func processResult<T: Codable>(jsonDecoder: JSONDecoder, completion: ((Result<T, Error>) -> Void)?) {
        if let underlyingError = self.error?.asAFError?.underlyingError {
            completion?(.failure(underlyingError))

            return
        }

        guard let response = self.data else {
            completion?(.failure(NetworkingErrorsEnum.unableToGetData))

            return
        }

        if case .failure = self.result {
            do {
                let dictionary = try JSONSerialization.jsonObject(
                    with: response, options: []
                ) as? [String: Any]

                guard let error = dictionary?["title"] as? String else {
                    completion?(.failure(NetworkingErrorsEnum.unableToGetData))

                    return
                }

                completion?(.failure(
                    NSError.createErrorWithLocalizedDescription(error)
                ))
            } catch {
                completion?(.failure(NetworkingErrorsEnum.unableToGetData))
            }

            return
        }

        do {
            let decodedResponse = try jsonDecoder.decode(T.self, from: response)

            completion?(.success(decodedResponse))
        } catch {
            completion?(.failure(error))
        }
    }
}
