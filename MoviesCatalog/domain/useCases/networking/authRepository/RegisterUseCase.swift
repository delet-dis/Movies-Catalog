//
//  RegisterUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation
import NeedleFoundation

protocol RegisterUseCaseDependency: Dependency {
    var registerUseCaseProvider: RegisterUseCase { get }
}

class RegisterUseCase {
    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(request: RegisterRequest, completion: ((Result<RegisterResponse, Error>) -> Void)? = nil) {
        authRepository.register(request: request, completion: completion)
    }
}
