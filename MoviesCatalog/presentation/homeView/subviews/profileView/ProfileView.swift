//
//  ProfileView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var viewModel: ProfileViewViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                    logoutUseCase: logoutUseCase
                )
            )
    }
}
