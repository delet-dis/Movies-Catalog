//
//  Profile.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation

struct Profile: Codable {
    let id: String
    let nickName: String?
    let email: String
    let avatarLink: String?
    let name: String
    let birthDate: Date?
    let gender: GenderTypeEnum
}
