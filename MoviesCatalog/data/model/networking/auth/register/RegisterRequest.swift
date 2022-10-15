//
//  RegisterRequest.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

struct RegisterRequest: Codable {
    let userName: String
    let name: String
    let password: String
    let email: String
    let birthDate: Date
    let gender: RegisterRequestGenderEnum
}
