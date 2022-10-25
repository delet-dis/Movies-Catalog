//
//  ProfileComponent.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation
import NeedleFoundation
import SwiftUI

protocol ProfileComponentDependency: Dependency {
    var getUserProfileUseCase: GetUserProfileUseCase { get }
    var saveUserProfileUseCase: SaveUserProfileUseCase { get }
    var logoutUseCase: LogoutUseCase { get }
}

final class ProfileComponent: Component<ProfileComponentDependency> {
    var profileViewViewModel: ProfileViewViewModel {
        shared {
            ProfileViewViewModel(
                getUserProfileUseCase: dependency.getUserProfileUseCase,
                saveUserProfileUseCase: dependency.saveUserProfileUseCase,
                logoutUseCase: dependency.logoutUseCase
            )
        }
    }

    var profileView: some View {
        shared {
            ProfileView()
                .environmentObject(profileViewViewModel)
        }
    }
}
