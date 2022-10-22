//
//  AuthRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

protocol AuthRepository {
    func register(request: RegisterRequest, completion: ((Result<RegisterResponse, Error>) -> Void)?)
    func login(request: LoginRequest, completion: ((Result<LoginResponse, Error>) -> Void)?)
    func logout(completion: ((Result<LogoutResponse, Error>) -> Void)?)
}
