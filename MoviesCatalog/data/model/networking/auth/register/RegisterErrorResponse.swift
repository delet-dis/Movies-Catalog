//
//  RegisterErrorResponse.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

struct RegisterErrorResponse {
    static func getErrorMessage(
        dictionary: [AnyHashable: Any],
        completion: ((Result<String, Error>) -> Void)?
    ) {
        guard let error = ((dictionary["errors"] as? [AnyHashable: Any])?.keys.first as? [AnyHashable: Any]),
              let errors = error["errors"] as? [Any],
              let errorText = ((errors[0] as? [AnyHashable: Any])?["errorMessage"] as? String) else {
            completion?(.failure(RegisterErrorsEnum.unableToGetError))

            return
        }

        completion?(.success(errorText))
    }
}
