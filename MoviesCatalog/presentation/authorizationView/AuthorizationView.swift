//
//  AuthorizationView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import SPAlert
import SwiftUI

struct AuthorizationView: View {
    private enum Field: Hashable {
        case username, password
    }

    @FocusState private var focusedField: Field?

    @EnvironmentObject private var viewModel: AuthorizationViewViewModel

    var body: some View {
        ScrollView {
            TextField("", text: $viewModel.usernameText)
                .textInputAutocapitalization(.never)
                .submitLabel(.next)
                .modifier(BodySmallModifier())
                .textFieldStyle(
                    TextFieldWithValidationStyle(
                        validationState: viewModel.isUsernameValid
                    )
                )
                .placeholder(when: viewModel.usernameText.isEmpty) {
                    Text(R.string.localizable.username())
                        .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
                        .modifier(BodySmallModifier())
                        .padding(.leading, 16)
                        .padding(.top, 13)
                        .padding(.bottom, 13)
                }
                .focused($focusedField, equals: .username)
                .onSubmit {
                    focusedField = .password
                }

            SecureField("", text: $viewModel.passwordText)
                .textInputAutocapitalization(.never)
                .submitLabel(.done)
                .textFieldStyle(
                    TextFieldWithValidationStyle(
                        validationState: viewModel.isPasswordValid
                    )
                )
                .placeholder(when: viewModel.passwordText.isEmpty) {
                    Text(R.string.localizable.password())
                        .foregroundColor(Color(uiColor: R.color.grayFaded() ?? .gray))
                        .modifier(BodySmallModifier())
                        .padding(.leading, 16)
                        .padding(.top, 13)
                        .padding(.bottom, 13)
                }
                .focused($focusedField, equals: .password)
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    private static let authRepository = AuthRepositoryImpl(jsonDecoder: JSONDecoder())
    private static let keychainRepository = KeychainRepositoryImpl()

    private static let loginUseCase = LoginUseCase(authRepository: authRepository)
    private static let saveAuthStatusUseCase = SaveAuthStatusUseCase()
    private static let saveTokenUseCase = SaveTokenUseCase(keychainRepository: keychainRepository)

    static var previews: some View {
        AuthorizationView()
            .environmentObject(AuthorizationViewViewModel(
                loginUseCase: loginUseCase,
                saveAuthStatusUseCase: saveAuthStatusUseCase,
                saveTokenUseCase: saveTokenUseCase
            )
            )
    }
}
