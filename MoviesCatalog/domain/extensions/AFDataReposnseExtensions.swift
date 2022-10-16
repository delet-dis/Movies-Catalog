//
//  AlamofireResultProcessorHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Alamofire
import Foundation

extension AFDataResponse {
    func processResult<T: Codable>(jsonDecoder: JSONDecoder, completion: ((Result<T, Error>) -> Void)?) {
        if case .failure = self.result {
            completion?(.failure(AuthRepositoryErrorsEnum.authorizationError))

            return
        }

        guard let response = self.data else {
            completion?(.failure(AuthRepositoryErrorsEnum.unableToGetData))

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
