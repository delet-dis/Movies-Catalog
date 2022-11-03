//
//  Movie.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

struct Movie: Codable, Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    let name: String
    let poster: String
    let year: Int
    let country: String
    let genres: [Genre]
    let reviews: [ShortReview]?
}
