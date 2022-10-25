//
//  ProfileDataEditorView.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import SwiftUI

struct ProfileDataEditorView: View {
    private enum Field: Hashable {
        case email, avatarLink, name, password, passwordConfirmation, birthDate
    }

    @Binding private var emailText: String
    @Binding private var avatarLinkText: String
    @Binding private var nameText: String
    @Binding private var birthDate: Date?
    @Binding private var birthDateAsString: String
    @Binding private var gender: GenderTypeEnum

    @State private var isDatePickerDisplaying = false

    @Namespace var genderPickerId

    @FocusState private var focusedField: Field?

    init(
        emailText: Binding<String>,
        avatarLinkText: Binding<String>,
        nameText: Binding<String>,
        birthDate: Binding<Date?>,
        birthDateAsString: Binding<String>,
        gender: Binding<GenderTypeEnum>
    ) {
        _emailText = emailText
        _avatarLinkText = avatarLinkText
        _nameText = nameText
        _birthDate = birthDate
        _birthDateAsString = birthDateAsString
        _gender = gender
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    VStack(spacing: 8) {
                        HStack {
                            Text(R.string.localizable.email())
                                .modifier(BodyModifier())
                                .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))

                            Spacer()
                        }

                        TextField("", text: $emailText)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle()
                            )
                            .focused($focusedField, equals: .email)
                            .onSubmit {
                                focusedField = .avatarLink
                            }
                    }

                    VStack(spacing: 8) {
                        HStack {
                            Text(R.string.localizable.avatarLink())
                                .modifier(BodyModifier())
                                .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))

                            Spacer()
                        }

                        TextField("", text: $avatarLinkText)
                            .disableAutocorrection(true)
                            .keyboardType(.URL)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle()
                            )
                            .focused($focusedField, equals: .avatarLink)
                            .onSubmit {
                                focusedField = .name
                            }
                    }

                    VStack(spacing: 8) {
                        HStack {
                            Text(R.string.localizable.name())
                                .modifier(BodyModifier())
                                .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))

                            Spacer()
                        }

                        TextField("", text: $nameText)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.words)
                            .submitLabel(.next)
                            .modifier(BodySmallModifier())
                            .textFieldStyle(
                                TextFieldWithValidationAndPlaceholderStyle()
                            )
                            .focused($focusedField, equals: .name)
                            .onSubmit {
                                focusedField = .birthDate
                            }
                    }

                    VStack(spacing: 8) {
                        HStack {
                            Text(R.string.localizable.birthDate())
                                .modifier(BodyModifier())
                                .foregroundColor(Color(uiColor: R.color.gray() ?? .gray))

                            Spacer()
                        }

                        ZStack {
                            HStack {
                                TextField("", text: $birthDateAsString)
                                    .textInputAutocapitalization(.never)
                                    .submitLabel(.next)
                                    .modifier(BodySmallModifier())
                                    .textFieldStyle(
                                        TextFieldWithValidationAndPlaceholderStyle()
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
                            isDatePickerDisplaying.toggle()
                        }
                    }

                    if isDatePickerDisplaying {
                        DatePicker(
                            R.string.localizable.birthDate(),
                            selection: Binding<Date>(
                                get: { birthDate ?? Date() },
                                set: { birthDate = $0 }
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
                        selection: $gender
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
        .onAppear {
            Self.applyCustomPickerStyle()
        }
        .onDisappear {
            Self.removeCustomPickerStyle()
        }
    }
}
