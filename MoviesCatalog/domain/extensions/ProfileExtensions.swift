//
//  ProfileExtensions.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 25.10.2022.
//

import Foundation

extension Profile {
    static func getNormalizedProfileFromBrokenData(_ data: Data) -> Self? {
        do {
            var decodedResponse = try JSONDecoder().decode(ProfileDTO.self, from: data)
            if let birthDate = decodedResponse.birthDate {
                decodedResponse.birthDate = birthDate + "Z"
            }

            if decodedResponse.avatarLink == "null" {
                decodedResponse.avatarLink = nil
            }

            if let birthDate = decodedResponse.birthDate {
                return Profile(
                    id: decodedResponse.id,
                    nickName: decodedResponse.nickName,
                    email: decodedResponse.email,
                    avatarLink: decodedResponse.avatarLink,
                    name: decodedResponse.name,
                    birthDate: ISO8601DateFormatter().date(from: birthDate),
                    gender: decodedResponse.gender
                )
            }
        } catch {
            return nil
        }

        return nil
    }
}
