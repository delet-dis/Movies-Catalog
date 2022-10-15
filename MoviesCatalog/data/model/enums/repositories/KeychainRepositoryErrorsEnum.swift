//
//  KeychainRepositoryErrorsEnum.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

enum KeychainRepositoryErrorsEnum: Error {
    case unableToSaveValue
    case unableToGetSavedValue
}

extension KeychainRepositoryErrorsEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToSaveValue: return R.string.localizable.unableToSaveValue()
        case .unableToGetSavedValue: return R.string.localizable.unableToGetSavedValue()
        }
    }
}
