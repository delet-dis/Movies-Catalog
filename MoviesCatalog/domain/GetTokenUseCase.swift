//
//  GetTokenUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation

protocol GetTokenUseCaseDependency: Dependency {
    var getTokenUseCaseProvider: GetTokenUseCase { get }
}

class GetTokenUseCase {
    private static let tokenKey = "AUTH_TOKEN"

    private let keychainRepository: KeychainRepository

    init(keychainRepository: KeychainRepository) {
        self.keychainRepository = keychainRepository
    }

    func execute(completion: ((Result<String, Error>) -> Void)?) {
        keychainRepository.getValueByKey(Self.tokenKey, completion: completion)
    }
}
