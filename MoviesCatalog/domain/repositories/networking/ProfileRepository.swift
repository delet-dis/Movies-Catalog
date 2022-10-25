//
//  ProfileRepository.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation

protocol ProfileRepository {
    func getUserProfile(token: String, completion: ((Result<Profile, Error>) -> Void)?)
    func saveUserProfile(
        token: String,
        newProfile: Profile,
        completion: ((Result<VoidResponse, Error>) -> Void)?
    )
}
