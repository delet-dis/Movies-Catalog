//
//  AuthorizationViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Combine
import Foundation

class AuthorizationViewViewModel: ObservableObject {
    @Published var usernameText = ""
    @Published var passwordText = ""

    @Published private(set) var isUsernameValid = true
    @Published private(set) var isPasswordValid = true
    @Published private(set) var areFieldsValid = true

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    @Published private(set) var isProgressViewShowing = false

    private var subscribers: Set<AnyCancellable> = []

    private let loginUseCase: LoginUseCase
    private let saveAuthStatusUseCase: SaveAuthStatusUseCase
    private let saveTokenUseCase: SaveTokenUseCase

    init(
        loginUseCase: LoginUseCase,
        saveAuthStatusUseCase: SaveAuthStatusUseCase,
        saveTokenUseCase: SaveTokenUseCase
    ) {
        self.loginUseCase = loginUseCase
        self.saveAuthStatusUseCase = saveAuthStatusUseCase
        self.saveTokenUseCase = saveTokenUseCase
    }

    private func resetValidationState() {
        isUsernameValid = true
        isPasswordValid = true
        areFieldsValid = true
    }

    private func initFieldsObserving() {
        initUsernameTextObserving()
        initPasswordTextObserving()
    }

    private func initUsernameTextObserving() {
        $usernameText.sink { [self] _ in
            self.isUsernameValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initPasswordTextObserving() {
        $passwordText.sink { [self] _ in
            self.isPasswordValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    func resetDisplayingData() {
        resetValidationState()

        usernameText = ""
        passwordText = ""
    }

    @discardableResult private func validateFields() -> Bool {
        resetValidationState()

        if !AuthenticationDataValidatorHelper.isUsernameValid(usernameText) {
            return false
        }

        if !AuthenticationDataValidatorHelper.isPasswordValid(passwordText) {
            return false
        }

        return true
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func login() {
        if validateFields() {
            loginUseCase.execute(
                request: LoginRequest(username: usernameText, password: passwordText)
            ) { [self] result in
                switch result {
                case .success(let response):
                    saveTokenUseCase.execute(token: response.token) { [self] result in
                        switch result {
                        case .success:
                            saveAuthStatusUseCase.execute(isAuthorized: true)
                        case .failure(let error):
                            processError(error)
                        }
                    }
                case .failure(let error):
                    processError(error)
                }
            }
        }
    }
}
