//
//  SaveAuthStatusUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import SwiftyUserDefaults

class SaveAuthStatusUseCase {
    func execute(isAuthorized: Bool, completion: ((Result<Void, Error>) -> Void)? = nil) {
        Defaults[\.isAuthorized] = isAuthorized

        completion?(.success(()))
    }
}
