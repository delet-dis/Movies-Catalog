//
//  RegistrationView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 17.10.2022.
//

import SPAlert
import SwiftUI

struct RegistrationView: View {
    private enum Field: Hashable {
        case username, email, name, password, passwordConfirmation, birthDate
    }

    @FocusState private var focusedField: Field?

    @EnvironmentObject private var viewModel: RegistrationViewViewModel

    @State private var areFieldsValid = false
    @State private var isProgressViewShowing = false
    @State private var isDatePickerDisplaying = false

    @Namespace var genderPickerId

    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        HStack {
                            Text(R.string.localizable.registration())
                                .modifier(H1Modifier())
                                .foregroundColor(Color(uiColor: R.color.accent() ?? .orange))

                            Spacer()
                        }

                        TextField("", text: $viewModel.usernameText)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle(
                                    validationState: viewModel.isUsernameValid,
                                    isPlaceholderDispalying: viewModel.usernameText.isEmpty,
                                    placeholderText: R.string.localizable.username()
                                )
                            )
                            .focused($focusedField, equals: .username)
                            .onSubmit {
                                focusedField = .email
                            }

                        TextField("", text: $viewModel.emailText)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle(
                                    validationState: viewModel.isEmailValid,
                                    isPlaceholderDispalying: viewModel.emailText.isEmpty,
                                    placeholderText: R.string.localizable.email()
                                )
                            )
                            .focused($focusedField, equals: .email)
                            .onSubmit {
                                focusedField = .name
                            }

                        TextField("", text: $viewModel.nameText)
                            .textInputAutocapitalization(.words)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle(
                                    validationState: viewModel.isNameValid,
                                    isPlaceholderDispalying: viewModel.nameText.isEmpty,
                                    placeholderText: R.string.localizable.name()
                                )
                            )
                            .focused($focusedField, equals: .name)
                            .onSubmit {
                                focusedField = .password
                            }

                        SecureField("", text: $viewModel.passwordText)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle(
                                    validationState: viewModel.isPasswordValid,
                                    isPlaceholderDispalying: viewModel.passwordText.isEmpty,
                                    placeholderText: R.string.localizable.password()
                                )
                            )
                            .focused($focusedField, equals: .password)
                            .onSubmit {
                                focusedField = .passwordConfirmation
                            }

                        SecureField("", text: $viewModel.confirmPasswordText)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle(
                                    validationState: viewModel.isPasswordConfirmationValid,
                                    isPlaceholderDispalying: viewModel.confirmPasswordText.isEmpty,
                                    placeholderText: R.string.localizable.passwordConfirmation()
                                )
                            )
                            .focused($focusedField, equals: .passwordConfirmation)
                            .onSubmit {
                                focusedField = .birthDate
                            }

                        ZStack {
                            HStack {
                                TextField("", text: $viewModel.birthDateAsString)
                                    .textInputAutocapitalization(.never)
                                    .submitLabel(.next)
                                    .modifier(BodySmallModifier())
                                    .textFieldStyle(
                                        TextFieldWithValidationAndPlaceholderStyle(
                                            validationState: viewModel.isBirthDateValid,
                                            isPlaceholderDispalying: viewModel.birthDateAsString.isEmpty,
                                            placeholderText: R.string.localizable.birthDate()
                                        )
                                    )
                                    .focused($focusedField, equals: .birthDate)
                                    .disabled(true)
                            }

                            HStack {
                                Spacer()

                                Image(uiImage: R.image.calendarIcon() ?? .strokedCheckmark)
                                    .padding(.trailing, 20)
                                    .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            focusedField = nil
                            viewModel.isDatePickerDisplaying.toggle()
                        }

                        if isDatePickerDisplaying {
                            DatePicker(
                                R.string.localizable.birthDate(),
                                selection: Binding<Date>(
                                    get: { viewModel.birthDate ?? Date() },
                                    set: { viewModel.birthDate = $0 }
                                ),
                                in: ...Date(),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.graphical)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        proxy.scrollTo(genderPickerId)
                                    }
                                }
                            }
                        }

                        Picker(
                            R.string.localizable.pickGender(),
                            selection: $viewModel.gender
                        ) {
                            EmptyView()
                                .tag(GenderTypeEnum.none)

                            Text(R.string.localizable.male())
                                .tag(GenderTypeEnum.male)

                            Text(R.string.localizable.female())
                                .tag(GenderTypeEnum.female)
                        }
                        .pickerStyle(.segmented)
                        .id(genderPickerId)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke().foregroundColor(
                                Color(uiColor: R.color.gray() ?? .gray
                                )
                            )
                        )
                        .padding(.bottom, 150)
                    }
                    .padding(.leading, 1)
                    .padding(.trailing, 1)
                    .padding(.top, 1)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 16)
            }

            VStack(spacing: 8) {
                Spacer()

                Button {
                    focusedField = nil

                    viewModel.register()
                } label: {
                    Text(R.string.localizable.register())
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
                .cornerRadius(4)
                .overlay(
                    areFieldsValid ?
                        nil :
                        RoundedRectangle(
                            cornerRadius: 4
                        ).stroke().foregroundColor(Color(uiColor: R.color.gray() ?? .gray))
                )

                Button {
                    viewModel.loginClickClosure?()
                } label: {
                    Text(R.string.localizable.iHaveAnAccount())
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
            isDatePickerDisplaying = viewModel.isDatePickerDisplaying

            Self.applyCustomPickerStyle()
        }
        .onDisappear {
            Self.removeCustomPickerStyle()
        }
        .onReceive(viewModel.$isProgressViewShowing) { value in
            withAnimation {
                self.isProgressViewShowing = value
            }
        }
        .onReceive(viewModel.$areFieldsValid) { value in
            withAnimation {
                self.areFieldsValid = value
            }
        }
        .onReceive(viewModel.$isDatePickerDisplaying) { value in
            withAnimation {
                self.isDatePickerDisplaying = value
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    private static let authRepository = AuthRepositoryImpl(
        jsonDecoder: JSONDecoder(), jsonEncoder: JSONEncoder()
    )
    private static let keychainRepository = KeychainRepositoryImpl()

    private static let registerUseCase = RegisterUseCase(authRepository: authRepository)
    private static let saveAuthStatusUseCase = SaveAuthStatusUseCase()
    private static let saveTokenUseCase = SaveTokenUseCase(keychainRepository: keychainRepository)

    static var previews: some View {
        RegistrationView()
            .environmentObject(RegistrationViewViewModel(
                registerUseCase: registerUseCase,
                saveAuthStatusUseCase: saveAuthStatusUseCase,
                saveTokenUseCase: saveTokenUseCase
            ))
    }
}
