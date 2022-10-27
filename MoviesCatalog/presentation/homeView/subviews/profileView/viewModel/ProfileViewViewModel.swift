//
//  ProfileViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Combine
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var avatarLinkText = ""
    @Published var nameText = ""
    @Published var birthDate: Date?
    @Published var birthDateAsString = ""
    @Published var gender: GenderTypeEnum = .none

    @Published private(set) var areFieldsValid = false

    @Published private(set) var displayingProfile: Profile?

    @Published var isAlertShowing = false
    @Published var isSuccessAlertShowing = false
    @Published private(set) var alertText = ""

    @Published private(set) var isProgressViewShowing = false

    private let dateFormatter = DateFormatter()

    private var subscribers: Set<AnyCancellable> = []

    private let getUserProfileUseCase: GetUserProfileUseCase
    private let saveUserProfileUseCase: SaveUserProfileUseCase
    private let logoutUseCase: LogoutUseCase
    private let getTokenUseCase: GetTokenUseCase

    init(
        getUserProfileUseCase: GetUserProfileUseCase,
        saveUserProfileUseCase: SaveUserProfileUseCase,
        logoutUseCase: LogoutUseCase,
        getTokenUseCase: GetTokenUseCase
    ) {
        self.getUserProfileUseCase = getUserProfileUseCase
        self.saveUserProfileUseCase = saveUserProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.getTokenUseCase = getTokenUseCase

        initFieldsObserving()

        dateFormatter.dateFormat = "dd.MM.y"
    }

    private func processError(_ error: Error) {
        alertText = error.localizedDescription
        isAlertShowing = true

        print(error)
    }

    private func initFieldsObserving() {
        initEmailTextObserving()
        initAvatarLinkTextObserving()
        initNameTextObserving()
        initBirthDateObserver()
        initGenderObserver()
    }

    private func initEmailTextObserving() {
        $emailText.sink { [self] _ in
            validateFields()
        }.store(in: &subscribers)
    }

    private func initAvatarLinkTextObserving() {
        $avatarLinkText.sink { [self] _ in
            validateFields()
        }.store(in: &subscribers)
    }

    private func initNameTextObserving() {
        $nameText.sink { [self] _ in
            validateFields()
        }.store(in: &subscribers)
    }

    private func initBirthDateObserver() {
        $birthDate.sink { [self] value in
            guard let value = value else {
                return
            }

            birthDateAsString = dateFormatter.string(from: value)

            validateFields()
        }.store(in: &subscribers)
    }

    private func initGenderObserver() {
        $gender.sink { [self] _ in
            // When the property changes, publishing occurs in the property’s willSet block, meaning
            // subscribers receive the new value before it’s actually set on the property.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.validateFields()
            }
        }.store(in: &subscribers)
    }

    @discardableResult private func validateFields() -> Bool {
        if !AuthenticationDataValidatorHelper.isEmailValid(emailText) {
            areFieldsValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isAvatarURLValid(avatarLinkText), !avatarLinkText.isEmpty {
            areFieldsValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isNameValid(nameText) {
            areFieldsValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isBirthDateValid(birthDate) {
            areFieldsValid = false

            return false
        }

        if !AuthenticationDataValidatorHelper.isGenderValid(gender) {
            areFieldsValid = false

            return false
        }

        areFieldsValid = true

        return true
    }

    func updateDisplayingData() {
        getTokenUseCase.execute { [self] result in
            switch result {
            case .success(let token):
                getUserProfileUseCase.execute(token: token) { [self] result in
                    switch result {
                    case .success(let profile):
                        updateDiaplyingProfile(displayingProfile: profile)
                    case .failure(let error):
                        processError(error)
                    }
                }
            case .failure(let error):
                processError(error)
            }
        }
    }

    private func updateDiaplyingProfile(displayingProfile: Profile) {
        self.displayingProfile = displayingProfile

        emailText = displayingProfile.email
        avatarLinkText = displayingProfile.avatarLink ?? ""
        nameText = displayingProfile.name
        birthDate = displayingProfile.birthDate
        if let profileBirthDate = displayingProfile.birthDate {
            birthDateAsString = dateFormatter.string(from: profileBirthDate)
        }
        gender = displayingProfile.gender
    }

    func saveUserProfile() {
        if validateFields() {
            isProgressViewShowing = true

            guard let profileId = displayingProfile?.id, let nickName = displayingProfile?.nickName else {
                return
            }

            let newProfile = Profile(
                id: profileId,
                nickName: nickName,
                email: emailText,
                avatarLink: avatarLinkText,
                name: nameText,
                birthDate: birthDate,
                gender: gender
            )

            getTokenUseCase.execute { [self] result in
                isProgressViewShowing = false

                switch result {
                case .success(let token):
                    saveUserProfileUseCase.execute(token: token, newProfile: newProfile) { [self] result in
                        switch result {
                        case .success:
                            updateDisplayingData()

                            isSuccessAlertShowing = true
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

    func logout() {
        logoutUseCase.execute()
    }
}
