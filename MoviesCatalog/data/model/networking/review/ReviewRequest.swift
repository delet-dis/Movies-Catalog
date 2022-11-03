//
//  ReviewRequest.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 03.11.2022.
//

import Foundation

struct ReviewRequest: Codable {
    let reviewText: String
    let rating: Int
    let isAnonymous: Bool
}
