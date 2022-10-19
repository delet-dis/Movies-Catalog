//
//  LoginViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published private(set) var loginViewDisplayingMode = LoginViewDisplayingModeEnum.authorization

    let authorizationComponent: AuthorizationComponent?
    let registrationComponent: RegistrationComponent?

    init(
        authorizationComponent: AuthorizationComponent? = nil,
        registrationComponent: RegistrationComponent? = nil
    ) {
        self.authorizationComponent = authorizationComponent
        self.registrationComponent = registrationComponent
    }

    func displayAuthorization() {
        loginViewDisplayingMode = .authorization
    }

    func dispalyRegistration() {
        loginViewDisplayingMode = .registration
    }

    func resetDisplayingData() {
        authorizationComponent?.authorizationViewViewModel.resetDisplayingData()
        registrationComponent?.registrationViweViewModel.resetDisplayingData()
    }
}
