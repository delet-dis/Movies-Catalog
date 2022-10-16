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

    @State private var areFieldsValid = false
    @State private var isProgressViewShowing = false

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
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
                .padding(.leading, 1)
                .padding(.trailing, 1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack(spacing: 8) {
                Spacer()

                Button {
                    focusedField = nil

                    viewModel.login()
                } label: {
                    Text(R.string.localizable.login())
                        .foregroundColor(areFieldsValid ?
                            .white
                            : Color(uiColor: R.color.accent() ?? .orange))
                        .modifier(BodyModifier())
                        .frame(maxWidth: .infinity)
                }
                .disabled(!areFieldsValid)
                .padding()
                .background(areFieldsValid ?
                    Color(uiColor: R.color.accent() ?? .orange) :
                    .gray.opacity(0))
                .cornerRadius(10)
                .overlay(
                    areFieldsValid ?
                        nil :
                        RoundedRectangle(
                            cornerRadius: 10
                        ).stroke().foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
                )

                NavigationLink {} label: {
                    Text(R.string.localizable.register())
                        .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                        .modifier(BodyModifier())
                        .padding(.vertical, 6)
                }
            }

            ProgressView()
                .opacity(isProgressViewShowing ? 1 : 0)
        }
        .onReceive(viewModel.$areFieldsValid) { value in
            withAnimation(.default) {
                self.areFieldsValid = value
            }
        }
        .padding(.horizontal, 16)
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
        .onReceive(viewModel.$isProgressViewShowing) { value in
            withAnimation(.default) {
                self.isProgressViewShowing = value
            }
        }
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
