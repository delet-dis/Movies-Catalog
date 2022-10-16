//
//  AuthRepositoryErrorsEnum.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

enum AuthRepositoryErrorsEnum: Error {
    case unableToGetData

    case authorizationError
}

extension AuthRepositoryErrorsEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToGetData: return R.string.localizable.unableToGetData()
        case .authorizationError: return R.string.localizable.authorizationError()
        }
    }
}
