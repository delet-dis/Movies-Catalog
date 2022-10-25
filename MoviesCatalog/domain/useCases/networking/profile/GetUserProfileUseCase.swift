//
//  GetUserProfileUseCase.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation
import NeedleFoundation

protocol GetUserProfileUseCaseDependency: Dependency {
    var getUserProfileUseCaseProvider: GetUserProfileUseCase { get }
}

class GetUserProfileUseCase {
    private let profileRepository: ProfileRepository

    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }

    func execute(token: String, completion: ((Result<Profile, Error>) -> Void)? = nil) {
        profileRepository.getUserProfile(token: token, completion: completion)
    }
}
