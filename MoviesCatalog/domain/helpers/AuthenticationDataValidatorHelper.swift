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

    private static func isEmptyAndBlank(_ string: String) -> Bool {
        string.isEmpty && string.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
