//
//  LoginRequest.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
}
