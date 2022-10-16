//
//  LoginViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published private(set) var loginViewDisplayingMode = LoginViewDisplayingMode.authorization

    let authorizationComponent: AuthorizationComponent?

    init(authorizationComponent: AuthorizationComponent? = nil) {
        self.authorizationComponent = authorizationComponent
    }

    func displayAuthorization() {
        loginViewDisplayingMode = .authorization
    }

    func dispalyRegistration() {
        loginViewDisplayingMode = .registration
    }
}
