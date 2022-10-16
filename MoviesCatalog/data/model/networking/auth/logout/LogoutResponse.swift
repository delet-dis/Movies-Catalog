//
//  LogoutResponse.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//

import Foundation

struct LogoutResponse: Codable {
    let token: String
    let message: String
}
