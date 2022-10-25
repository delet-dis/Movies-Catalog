//
//  ProfileViewViewModel.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation

class ProfileViewViewModel: ObservableObject {
    private let getUserProfileUseCase: GetUserProfileUseCase
    private let saveUserProfileUseCase: SaveUserProfileUseCase
    private let logoutUseCase: LogoutUseCase

    init(
        getUserProfileUseCase: GetUserProfileUseCase,
        saveUserProfileUseCase: SaveUserProfileUseCase,
        logoutUseCase: LogoutUseCase
    ) {
        self.getUserProfileUseCase = getUserProfileUseCase
        self.saveUserProfileUseCase = saveUserProfileUseCase
        self.logoutUseCase = logoutUseCase
    }
}
