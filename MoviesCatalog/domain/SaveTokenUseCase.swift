//
//  SaveTokenUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation

protocol SaveTokenUseCaseDependency: Dependency {
    var saveTokenUseCaseProvider: SaveTokenUseCase { get }
}

class SaveTokenUseCase {
    private static let tokenKey = "AUTH_TOKEN"

    private let keychainRepository: KeychainRepository

    init(keychainRepository: KeychainRepository) {
        self.keychainRepository = keychainRepository
    }

    func execute(token: String, completion: ((Result<Void, Error>) -> Void)?) {
        keychainRepository.saveValueByKey(Self.tokenKey, value: token, completion: completion)
    }
}
