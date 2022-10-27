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

    @State private var areFieldsValid = false
    @State private var isProgressViewShowing = false

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

            VStack(spacing: 8) {
                Spacer()

                Button {
                    viewModel.saveUserProfile()
                } label: {
                    Text(R.string.localizable.save())
                        .foregroundColor(viewModel.areFieldsValid ?
                            .white
                            : Color(uiColor: R.color.accent() ?? .orange))
                        .modifier(BodyModifier())
                        .frame(maxWidth: .infinity)
                }
                .disabled(!areFieldsValid || isProgressViewShowing)
                .padding()
                .background(areFieldsValid ?
                    Color(uiColor: R.color.accent() ?? .orange) :
                    .gray.opacity(0))
                .cornerRadius(4)
                .overlay(
                    areFieldsValid ?
                        nil :
                        RoundedRectangle(
                            cornerRadius: 4
                        ).stroke().foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
                )

                Button {
                    viewModel.logout()
                } label: {
                    Text(R.string.localizable.logout())
                        .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                        .modifier(BodyModifier())
                        .padding(.vertical, 6)
                }
            }
            .padding(.bottom, 16)
            .padding(.horizontal, 16)

            ProgressView()
                .opacity(isProgressViewShowing ? 1 : 0)
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .onAppear {
            isProgressViewShowing = viewModel.isProgressViewShowing
            areFieldsValid = viewModel.areFieldsValid

            viewModel.updateDisplayingData()
        }
        .onReceive(viewModel.$areFieldsValid) { value in
            withAnimation(.default) {
                self.areFieldsValid = value
            }
        }
        .onReceive(viewModel.$isProgressViewShowing) { value in
            withAnimation(.default) {
                self.isProgressViewShowing = value
            }
        }
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
        .SPAlert(
            isPresent: $viewModel.isSuccessAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .done,
            haptic: .success
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
