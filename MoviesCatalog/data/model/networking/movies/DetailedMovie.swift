//
//  DetailedMovie.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation

struct DetailedMovie: Codable {
    let id: String
    let name: String
    let poster: String
    let year: Int
    let country: String
    let genres: [Genre]
    let reviews: [DetailedReview]
    let time: Int
    let tagline: String
    let welcomeDescription: String
    let director: String
    let budget: String
    let fees: String
    let ageLimit: Int
}
