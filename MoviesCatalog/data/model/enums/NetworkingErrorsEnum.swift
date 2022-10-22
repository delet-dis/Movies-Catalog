//
//  NetworkingErrorsEnum.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation

enum NetworkingErrorsEnum: Error {
    case unableToGetData
    case sessionIsExpired
}

extension NetworkingErrorsEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToGetData: return R.string.localizable.unableToGetData()
        case .sessionIsExpired: return R.string.localizable.sessionIsExpired()
        }
    }
}
