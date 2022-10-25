//
//  ProfileView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import SPAlert
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var viewModel: ProfileViewViewModel

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                if let displayingProfile = viewModel.displayingProfile {
                    HStack {
                        ProfileHeaderView(profile: displayingProfile)

                        Spacer()
                    }

                    ProfileDataEditorView(
                        emailText: $viewModel.emailText,
                        avatarLinkText: $viewModel.avatarLinkText,
                        nameText: $viewModel.nameText,
                        birthDate: $viewModel.birthDate,
                        birthDateAsString: $viewModel.birthDateAsString,
                        gender: $viewModel.gender
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.updateDisplayingData()
        }
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    private static let authRepository = AuthRepositoryImpl(
        jsonDecoder: JSONDecoder(),
        jsonEncoder: JSONEncoder()
    )
    private static let keychainRepository = KeychainRepositoryImpl()
    private static let profileRepository = ProfileRepositoryImpl(
        jsonDecoder: JSONDecoder(),
        jsonEncoder: JSONEncoder()
    )

    private static let saveAuthStatusUseCase = SaveAuthStatusUseCase()
    private static let saveTokenUseCase = SaveTokenUseCase(keychainRepository: keychainRepository)
    private static let getTokenUseCase =
        GetTokenUseCase(keychainRepository: keychainRepository)
    private static let logoutUseCase = LogoutUseCase(
        authRepository: authRepository,
        saveAuthStatusUseCase: saveAuthStatusUseCase,
        saveTokenUseCase: saveTokenUseCase
    )

    private static let getUserProfileUseCase = GetUserProfileUseCase(profileRepository: profileRepository)
    private static let saveUserProfileUseCase = SaveUserProfileUseCase(profileRepository: profileRepository)

    static var previews: some View {
        ProfileView()
            .environmentObject(
                ProfileViewViewModel(
                    getUserProfileUseCase: getUserProfileUseCase,
                    saveUserProfileUseCase: saveUserProfileUseCase,
                    logoutUseCase: logoutUseCase,
                    getTokenUseCase: getTokenUseCase
                )
            )
    }
}
