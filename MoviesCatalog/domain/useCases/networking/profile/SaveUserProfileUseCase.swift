//
//  SaveUserProfileUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation
import NeedleFoundation

protocol SaveUserProfileUseCaseDependency: Dependency {
    var saveUserProfileUseCaseProvider: SaveUserProfileUseCase { get }
}

class SaveUserProfileUseCase {
    private let profileRepository: ProfileRepository

    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }

    func execute(
        token: String,
        newProfile: Profile,
        completion: ((Result<VoidResponse, Error>) -> Void)? = nil
    ) {
        profileRepository.saveUserProfile(token: token, newProfile: newProfile, completion: completion)
    }
}
