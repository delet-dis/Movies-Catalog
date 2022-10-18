//
//  DefaultsRepositoryErrorsEnum.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation

enum DefaultsRepositoryErrorsEnum: Error {
    case unableToGetData
}

extension DefaultsRepositoryErrorsEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToGetData: return R.string.localizable.unableToGetData()
        }
    }
}
