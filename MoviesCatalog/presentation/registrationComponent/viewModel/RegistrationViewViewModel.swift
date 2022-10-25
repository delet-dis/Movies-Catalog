//
//  RegistrationViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 17.10.2022.
//

import Combine
import Foundation

class RegistrationViewViewModel: ObservableObject {
    @Published var usernameText = ""
    @Published var emailText = ""
    @Published var nameText = ""
    @Published var passwordText = ""
    @Published var confirmPasswordText = ""
    @Published var birthDate: Date?
    @Published var birthDateAsString = ""
    @Published var gender: GenderTypeEnum = .none

    @Published private(set) var isUsernameValid = true
    @Published private(set) var isEmailValid = true
    @Published private(set) var isNameValid = true
    @Published private(set) var isPasswordValid = true
    @Published private(set) var isPasswordConfirmationValid = true
    @Published private(set) var arePasswordsEqual = true
    @Published private(set) var isBirthDateValid = true
    @Published private(set) var isGenderValid = true
    @Published private(set) var areFieldsValid = false

    @Published var isAlertShowing = false
    @Published private(set) var alertText = ""

    @Published private(set) var isProgressViewShowing = false
    @Published var isDatePickerDisplaying = false

    private var subscribers: Set<AnyCancellable> = []

    private(set) var loginClickClosure: (() -> Void)?

    private let dateFormatter = DateFormatter()

    private let registerUseCase: RegisterUseCase
    private let saveAuthStatusUseCase: SaveAuthStatusUseCase
    private let saveTokenUseCase: SaveTokenUseCase

    init(
        registerUseCase: RegisterUseCase,
        saveAuthStatusUseCase: SaveAuthStatusUseCase,
        saveTokenUseCase: SaveTokenUseCase
    ) {
        self.registerUseCase = registerUseCase
        self.saveAuthStatusUseCase = saveAuthStatusUseCase
        self.saveTokenUseCase = saveTokenUseCase

        initFieldsObserving()

        dateFormatter.dateFormat = "dd.MM.y"
    }

    func setLoginClickClosure(loginClickClosure: (() -> Void)? = nil) {
        self.loginClickClosure = loginClickClosure
    }

    private func resetValidationState() {
        isUsernameValid = true
        isEmailValid = true
        isNameValid = true
        isPasswordValid = true
        isPasswordConfirmationValid = true
        arePasswordsEqual = true
        isBirthDateValid = true
        isGenderValid = true
    }

    private func initFieldsObserving() {
        initUsernameTextObserving()
        initEmailTextObserving()
        initNameTextObserving()
        initPasswordTextObserving()
        initPasswordConfirmationTextObserving()
        initBirthDateObserver()
        initGenderObserver()
    }

    private func initUsernameTextObserving() {
        $usernameText.sink { [self] _ in
            self.isUsernameValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initEmailTextObserving() {
        $emailText.sink { [self] _ in
            self.isEmailValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initNameTextObserving() {
        $nameText.sink { [self] _ in
            self.isNameValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initPasswordTextObserving() {
        $passwordText.sink { [self] _ in
            self.isPasswordValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initPasswordConfirmationTextObserving() {
        $confirmPasswordText.sink { [self] _ in
            self.isPasswordConfirmationValid = true

            validateFields()
        }.store(in: &subscribers)
    }

    private func initBirthDateObserver() {
        $birthDate.sink { [self] value in
            self.isBirthDateValid = true

            guard let value = value else {
                return
            }

            birthDateAsString = dateFormatter.string(from: value)

            validateFields()
        }.store(in: &subscribers)
    }

    private func initGenderObserver() {
        $gender.sink { [self] _ in
            self.isGenderValid = true

            // When the property changes, publishing occurs in the property’s willSet block, meaning
            // subscribers receive the new value before it’s actually set on the property.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.validateFields()
            }
        }.store(in: &subscribers)
    }

    @discardableResult private func validateFields() -> Bool {
        resetValidationState()

        if !AuthenticationDataValidatorHelper.isUsernameValid(usernameText) {
            areFieldsValid = false
//            isUsernameValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isEmailValid(emailText) {
            areFieldsValid = false
//            isEmailValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isNameValid(nameText) {
            areFieldsValid = false
//            isNameValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isPasswordValid(passwordText) {
            areFieldsValid = false
//            isPasswordValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isPasswordValid(confirmPasswordText) {
            areFieldsValid = false
//            isPasswordConfirmationValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.arePasswordsValid(
            firstPassword: passwordText,
            passwordConfirmation: confirmPasswordText
        ) {
            areFieldsValid = false
//            arePasswordsEqual = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isBirthDateValid(birthDate) {
            areFieldsValid = false
//            isBirthDateValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isGenderValid(gender) {
            areFieldsValid = false
//            isGenderValid = false

            return false
        }

        areFieldsValid = true

        return true
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    func register() {
        if validateFields() {
            guard let birthDate = birthDate else {
                return
            }

            isDatePickerDisplaying = false
            isProgressViewShowing = true

            registerUseCase.execute(
                request: RegisterRequest(
                    userName: usernameText,
                    name: nameText,
                    password: passwordText,
                    email: emailText,
                    birthDate: birthDate,
                    gender: gender
                )
            ) { [self] result in
                isProgressViewShowing = false

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

    func resetDisplayingData() {
        resetValidationState()

        usernameText = ""
        emailText = ""
        nameText = ""
        passwordText = ""
        confirmPasswordText = ""
        birthDate = Date.now
        birthDateAsString = ""
        gender = .none
    }
}
