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

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(request: LogoutRequest, completion: ((Result<LogoutResponse, Error>) -> Void)? = nil) {
        authRepository.logout(request: request, completion: completion)
    }
}
