//
//  ProfileDTO.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

struct ProfileDTO: Codable {
    let id: String
    let nickName: String?
    let email: String
    var avatarLink: String?
    let name: String
    var birthDate: String?
    let gender: GenderTypeEnum
}
