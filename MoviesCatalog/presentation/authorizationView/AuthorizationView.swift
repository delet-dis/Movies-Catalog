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
                                validationState: viewModel.isUsernameValid,
                                isPlaceholderDispalying: viewModel.usernameText.isEmpty,
                                placeholderText: R.string.localizable.username()
                            )
                        )
                        .focused($focusedField, equals: .username)
                        .onSubmit {
                            focusedField = .password
                        }

                    SecureField("", text: $viewModel.passwordText)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .submitLabel(.done)
                        .textFieldStyle(
                            TextFieldWithValidationStyle(
                                validationState: viewModel.isPasswordValid,
                                isPlaceholderDispalying: viewModel.passwordText.isEmpty,
                                placeholderText: R.string.localizable.password()
                            )
                        )
                        .focused($focusedField, equals: .password)
                }
                .padding(.leading, 1)
                .padding(.trailing, 1)
                .padding(.top, 1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 16)

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
                .disabled(!areFieldsValid || isProgressViewShowing)
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

                Button {
                    viewModel.registerClickClosure?()
                } label: {
                    Text(R.string.localizable.register())
                        .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))
                        .modifier(BodyModifier())
                        .padding(.vertical, 6)
                }
            }
            .padding(.horizontal, 16)
            .ignoresSafeArea(.keyboard)

            ProgressView()
                .opacity(isProgressViewShowing ? 1 : 0)
        }
        .background(Color(uiColor: R.color.darkAccent() ?? .black))
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Button(R.string.localizable.done()) {
                        focusedField = nil
                    }
                    .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))

                    Spacer()
                }
            }
        }
        .SPAlert(
            isPresent: $viewModel.isAlertShowing,
            message: viewModel.alertText,
            dismissOnTap: false,
            preset: .error,
            haptic: .error
        )
        .onAppear {
            isProgressViewShowing = viewModel.isProgressViewShowing
            areFieldsValid = viewModel.areFieldsValid
        }
        .onReceive(viewModel.$isProgressViewShowing) { value in
            withAnimation(.default) {
                self.isProgressViewShowing = value
            }
        }
        .onReceive(viewModel.$areFieldsValid) { value in
            withAnimation(.default) {
                self.areFieldsValid = value
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
