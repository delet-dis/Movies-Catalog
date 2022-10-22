//
//  MoviesPageInfo.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 22.10.2022.
//

import Foundation

struct MoviesPageInfo: Codable {
    let pageSize: Int
    let pageCount: Int
    let currentPage: Int
}
