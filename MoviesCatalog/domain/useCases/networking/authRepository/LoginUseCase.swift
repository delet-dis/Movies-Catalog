//
//  LoginUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation

protocol LoginUseCaseDependency: Dependency {
    var loginUseCaseProvider: LoginUseCase { get }
}

class LoginUseCase {
    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(request: LoginRequest, completion: ((Result<LoginResponse, Error>) -> Void)? = nil) {
        authRepository.login(request: request, completion: completion)
    }
}
