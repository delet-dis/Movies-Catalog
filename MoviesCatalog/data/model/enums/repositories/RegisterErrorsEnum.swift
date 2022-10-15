//
//  RegisterErrorsEnum.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

enum RegisterErrorsEnum: Error {
    case unableToGetError
}

extension RegisterErrorsEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToGetError: return R.string.localizable.unableToGetError()
        }
    }
}
