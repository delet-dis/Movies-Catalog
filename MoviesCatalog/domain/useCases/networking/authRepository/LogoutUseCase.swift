//
//  LogoutUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation

protocol LogoutUseCaseDependency: Dependency {
    var logoutUseCaseProvider: LogoutUseCase { get }
}

class LogoutUseCase {
    private let authRepository: AuthRepository
    private let saveAuthStatusUseCase: SaveAuthStatusUseCase
    private let saveTokenUseCase: SaveTokenUseCase

    init(
        authRepository: AuthRepository,
        saveAuthStatusUseCase: SaveAuthStatusUseCase,
        saveTokenUseCase: SaveTokenUseCase
    ) {
        self.authRepository = authRepository
        self.saveAuthStatusUseCase = saveAuthStatusUseCase
        self.saveTokenUseCase = saveTokenUseCase
    }

    func execute(completion: ((Result<LogoutResponse, Error>) -> Void)? = nil) {
        authRepository.logout(completion: completion)

        saveAuthStatusUseCase.execute(isAuthorized: false)
        saveTokenUseCase.execute(token: "")
    }
}
