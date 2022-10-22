//
//  MoviesPage.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation

struct MoviesPage: Codable {
    let pageInfo: MoviesPageInfo
    let movies: [Movie]
}
