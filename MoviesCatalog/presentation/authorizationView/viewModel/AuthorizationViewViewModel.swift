//
//  AuthorizationViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Combine
import Foundation

class AuthorizationViewViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""

    @Published private(set) var isEmailValid = true
    @Published private(set) var isPasswordValid = true

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    @Published private(set) var isProgressViewShowing = false

    private var subscribers: Set<AnyCancellable> = []

    private let loginUseCase: LoginUseCase

    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    private func resetValidationState() {
        isEmailValid = true
        isPasswordValid = true
    }

    private func initFieldsObserving() {
        initEmailTextObserving()
        initPasswordTextObserving()
    }

    private func initEmailTextObserving() {
        $emailText.sink { _ in
            self.isEmailValid = true
        }.store(in: &subscribers)
    }

    private func initPasswordTextObserving() {
        $passwordText.sink { _ in
            self.isPasswordValid = true
        }.store(in: &subscribers)
    }

    func resetDisplayingData() {
        resetValidationState()

        emailText = ""
        passwordText = ""
    }
}
