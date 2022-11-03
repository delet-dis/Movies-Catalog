//
//  DetailedReview.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation

struct DetailedReview: Codable {
    let id: String
    let rating: Int
    let reviewText: String?
    let isAnonymous: Bool
    let createDateTime: String
    let author: Author?
}
