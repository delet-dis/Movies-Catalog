//
//  DisplayingFavotireMovie.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

struct DisplayingFavotireMovie: Identifiable {
    let id = UUID().uuidString
    let movie: Movie
    let tapClosure: (() -> Void)?
    let deleteClosure: (() -> Void)?
}
