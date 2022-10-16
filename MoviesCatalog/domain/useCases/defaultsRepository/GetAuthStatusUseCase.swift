//
//  GetAuthStatusUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation
import SwiftyUserDefaults

class GetAuthStatusUseCase {
    func execute(completion: ((Result<Bool, Error>) -> Void)? = nil) {
        guard let isAuthorized = Defaults[\.isAuthorized] else{
            completion?(.failure(DefaultsRepositoryErrorsEnum.unableToGetData))

            return
        }

        completion?(.success(isAuthorized))
    }
}
