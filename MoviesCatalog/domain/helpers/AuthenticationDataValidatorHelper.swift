//
//  AuthenticationDataValidatorHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 16.10.2022.
//

import Foundation

class AuthenticationDataValidatorHelper {
    static func isUsernameValid(_ username: String) -> Bool {
        !isEmptyAndBlank(username)
    }

    static func isPasswordValid(_ password: String) -> Bool {
        !isEmptyAndBlank(password)
    }

    private static var emailPredicate = NSPredicate(
        format: "SELF MATCHES %@",
        // swiftlint:disable:next line_length
        "^(?!\\.)([A-Z0-9a-z_%+-]?[\\.]?[A-Z0-9a-z_%+-])+@[A-Za-z0-9-]{1,20}(\\.[A-Za-z0-9]{1,15}){0,10}\\.[A-Za-z]{2,20}$"
    )

    static func isEmailValid(_ email: String) -> Bool {
        emailPredicate.evaluate(with: email)
    }

    static func arePasswordsValid(firstPassword: String, passwordConfirmation: String) -> Bool {
        firstPassword == passwordConfirmation
    }

    static func isNameValid(_ name: String) -> Bool {
        !isEmptyAndBlank(name)
    }

    static func isBirthDateValid(_ date: Date?) -> Bool {
        guard let date = date else {
            return false
        }

        return date < Date.now
    }

    static func isGenderValid(_ gender: GenderTypeEnum?) -> Bool {
        guard gender != nil else {
            return false
        }

        return gender != GenderTypeEnum.none
    }

    private static func isEmptyAndBlank(_ string: String) -> Bool {
        string.isEmpty && string.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
